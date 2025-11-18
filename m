Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B586E3563E1
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 15:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763478182; cv=none; b=DrunUahbRhfZYOXcxUL9FxwW29kfkhqjiSi3Uf0ie/QhYb5DUPdu761hyXDAz4lkZl01enVj+2FtNRqAgA8eYrdyKLeOMkcMin5I2Gb5w3AsdiIHC/bs//suhfSrLVDnpoeJSijkZdc1k7lrUuoPDhfOeAthmwnVUvpDsATbATw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763478182; c=relaxed/simple;
	bh=v5nImH+xK+9SL4E4MH8KbpIvlaO5c50Qq/PRIW/0KbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AUxgQrcg7JscNwJZe/mo5VLorXcZJUemawdJNyBgfi4USdr+LSlqK2bXMvgU8Qpg3aDoZRSC/y6Wuo6GJerlXi3qkLabwjhza1ug1eqEkZMOUp97pbApIPjkDTofOnd6p4WlAaQ2TZkQUzF+7dYyKdAVWLKVPI3uxAyTfZuRxkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SvYxmp4d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gc9uC5zD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvYxmp4d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gc9uC5zD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8E1VF2194370
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 15:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jkUfsqF7fHbwcY/CG3Vr07bqMbj6EV4hLs+8T8s4P6Q=; b=SvYxmp4dxkjF1Eq/
	M3+NBGJmb5ZH+L6kYsnni7vTyXPFJHokizXleotd1nNPyGfVoW/MAviP2fcsE1Sg
	IWfcBn3wVV7NOcbr0POp5fp9PF2wm5ygjgdK9CzhfRqc5pUSSpDZG6Sj5FEW9dYO
	/rrG7hDfCo9v37LXBkUmJjf51fhtXIztw9KR/AhG3IRpakBERVCbwN5OttmX+VlS
	ER69w6+0bgtmCrP8sqnCKoZb0WQwpLHLj+p7k1y1dzbACIQeVecRNN8gi/snm08M
	5RrGq7NFBxXZi1SiWvC2xjK5q7FZTdmeC8OUZmkA/8pqjKgFN6Rm3/F1uhUHXO4n
	s2vdtQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agn3y952e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 15:02:59 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7c75f24b7daso990579a34.3
        for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 07:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763478179; x=1764082979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jkUfsqF7fHbwcY/CG3Vr07bqMbj6EV4hLs+8T8s4P6Q=;
        b=gc9uC5zDkpQiAqmw1G9NOCyVNbUN/APM5THkn6L8kcgN2ZYXQf113gXGwcxS/R8a2J
         S+eKTmy+w+LbRXBaBdsb3u519tfO5qxUkhleSaU14+h3LdIrY6zKHwluAIXIaHgmAi2G
         hHMTsMWbitbGKeOXWAplIYhT2Ae8WGK9ZV96kTrwd9KMG/BzBPtFPH+8CuS5L803Ad7T
         fPSbNR0KC5pv5nj305KRc8WcrFSEpA8pIbyQdC5WWmfviIBaJjOXi49Kovln8AhcZiDi
         96jwz49x7PKPAD89079eVrZ1l1kqiS+i+QloCjK9PPwU0gi7F3DCMeQXHAy7uTM2WJmE
         0NUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478179; x=1764082979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jkUfsqF7fHbwcY/CG3Vr07bqMbj6EV4hLs+8T8s4P6Q=;
        b=joA0tri6LHMX7lTmt+rt3z1rf7SobSapR23OpcUvpJIvAeQTOdlDMb2UHDqsGiNM/p
         uzA8TxpHZ234rNh+12o6oFAK9r5/EzWvO7IOVBMTjFfUOREHMb6MSJ7MaKC6ePV1Lm76
         DoO3Xl1EYKSgBI8kirlFd4AMIzAigl9NZo78nT8Z3xW1FuUuR27fOFJ58eBxY13CLR07
         c4CDUeaqVsHJ5PGKYUV3ZYHvCQ0zSV7uQPoREinEjFbXfWFAdb3S23BOABQRAdb4g4xM
         H3Sc7Hr5XyA9U+PN58TAthVkAm8R5Cv5yZ/SQwMkoKibgAMeeOeKq4BL6umXHWgNZPGs
         JGfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbHNQjuZIF1WiaYpFpCH/DdNfGTT8Ik7FFgUG+dfFSp2yyKT14feYbDBrHjO3HhIK2f8VGacHc2ealRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2BS8irw8kgAL0+8ECxb+LJl9ANuMEIJ3irobKOVHrfeUH2PeD
	VKPfRaSKq1zMZD7Mthh5bIz3w29K5qulruIcAAs1SSMMKFkF62xLTpFlE9BRU7PKrhNYUxTXQx0
	rI1W5IDC8T7taIs2scTDx4CREm5rA9JPxICHAtZmP+D/CsqwPi/o7nbnwG2szkRL6lp2J5I/Jcg
	==
X-Gm-Gg: ASbGnctWnrzMRFbUgSfltEPOHG/qaWEItd9t0jRqSixQxaiNGivHCMj92zpWJlwywYt
	hD1jbSRPNt+HohHNQWLn5uAzgYw6Pg12FuZnkGlyQcrnOBAOUO1SozRA+iGhfYqJB0ZE+/E+EyQ
	qD++16gRSA6oQ6EMaYYt9dV9AQmdp90WxpEFOqMBBFDHIqtmNSyLaPAfnemKmwP9MsdC/elthQ6
	wZcuYlOMO0a303VnnYME0s5qP0O5XEKYOtxHli9wXkerYsIuAVDUUexGHDrANMWAbVvrVLMMaSQ
	gcQLRspqaP6UHvPhqFfgiXnJpKTLlSlAUZaEcEfdS2DbLl2q3BG0tUmtpJWaN+vByXEu+zaSWoE
	ZwlDA31nS07E4mbGIXdH4J167uQU1bSVsw3HfdVfWwa7rqOQCwqzyPTQP9bclVNISPd0=
X-Received: by 2002:a05:6808:2006:b0:450:456c:ecac with SMTP id 5614622812f47-45097569238mr4604864b6e.6.1763478178670;
        Tue, 18 Nov 2025 07:02:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTkmjEbG1bOBUmUhskRwPcIJ2t3hyrWgqr88XZ97OQx2rGABdJ9AERVUyZlfj43/laMV+EZw==
X-Received: by 2002:a05:6808:2006:b0:450:456c:ecac with SMTP id 5614622812f47-45097569238mr4604843b6e.6.1763478178062;
        Tue, 18 Nov 2025 07:02:58 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3f961bsm13032422a12.14.2025.11.18.07.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 07:02:56 -0800 (PST)
Message-ID: <c3f9d05a-1811-43cd-ba55-3a1766808185@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 16:02:54 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sdm845-oneplus: Mark l14a
 regulator as boot-on
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251118-dts-oneplus-regulators-v2-0-3e67cea1e4e7@ixit.cz>
 <20251118-dts-oneplus-regulators-v2-3-3e67cea1e4e7@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-dts-oneplus-regulators-v2-3-3e67cea1e4e7@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEyMSBTYWx0ZWRfX89y8AWg5dopg
 YtLyZvU/Wa4SxFuxzGSeUZtkqKatIaadldvehulN5bRAVaya36PqTu5FIDmFdjuHZtI6Qn0WMZQ
 NcDWZ1BMcKSfP4ALDKfPIjfqKmTk6uqIP5vVUoGicmhy21jTYUqzG6K7BnBcidl7FqFUDWlj4Cl
 BbUUbs51tu9YBRZmm96AbwNi3bmNihe3PGnASXbOQQiFuk1dZWq6tLN6cs5Hne5pyBFWs4aihN/
 TrxfLnQyPNase+kro+QzfXTOk80j94G1+996gQCmI4PSmiTzHhrhSmVeGWkngww1F5ZxLUKzfAX
 z5EYY2+O/TFjHEgOhhAdcJnNLDzgc3IckMFxqI1E2cA4pPFAop9GVz9vz14WmvACgFHMje21kqk
 X0CGR4D7JAROVJQbfV/UjDRI+5IyPA==
X-Proofpoint-GUID: jmtRaOI_u1rGT5BxMAmQAQkfQ_uGMTJZ
X-Proofpoint-ORIG-GUID: jmtRaOI_u1rGT5BxMAmQAQkfQ_uGMTJZ
X-Authority-Analysis: v=2.4 cv=FtIIPmrq c=1 sm=1 tr=0 ts=691c8aa4 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=BiXyI_okxTJ3JasmUDMA:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180121

On 11/18/25 3:52 PM, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> This regulator is used only for the display, which is enabled by the
> bootloader and left on for continuous splash. Mark it as such.
> 
> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
