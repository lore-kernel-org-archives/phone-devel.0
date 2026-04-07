Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C4139BFEA
	for <phone-devel@vger.kernel.org>; Tue,  7 Apr 2026 10:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557634; cv=none; b=fikf/n75y+GfGuOWZKkxnjpyLNDffzrk6QW4bq/i6q8Zj515gI0uxQz3Xtw27gyAABg9gFDMLOnPBNj5cUMhUYbca2jbqavvoVCkQq32Bf90q9UTHFQwH/4KdYognjS5hMUhr8CQpGoQfK5LVjSYq8QpXIBBg7SaTCPk3OLN5BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557634; c=relaxed/simple;
	bh=C9jS0F/gOzlNdQxVxMT4uShJahv/zsqDh6pXRNRZRew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rzjme39L6C0RkmWpwm/706au8FYMgl7KHSS4HwbhvztVj3pLEAgss3/OiEbpl0heMbVvJWDxQJEVVCxOzntKfGDXl4PoPQoTVDP6G+nuaDs3hrjoN7WC3tsoVju8/f1gIJENI4eC04Ay5tCuunETn1nrn2mg0z4pe8b2MoQB64c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IA5fkyJv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xfekwt8a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IA5fkyJv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xfekwt8a"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376h5KD493144
	for <phone-devel@vger.kernel.org>; Tue, 7 Apr 2026 10:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJ2YM48Z+WEEP7jumahO4mqpHrMt/fCy33Bct9rpYnw=; b=IA5fkyJvl9h0hHVo
	DOIu8XsmmeEekiKnN8+PaChhtIMkjVJrVtWxeZrrpt7ZF/wp/ioF7ruzzSnj65k/
	M8uJQwIELhJ+mzfmC7kyjuUucyTFOIvz7w8bIP1vsHSNi3W/EZgoQ0q7VmrEr/mP
	8v0gBDrC75hq6F15CNUPuzCDqP+jPDSWX/hTNRSC72gSLyTzFkCBZ0FFaK8Ng9iU
	7JP3L5GShHhKmbw48Poz8ofFge/x66g2b8guwEFLgfcmrBcudBfFX8w9tK/bfMDD
	GsP9LsKvQNTt+qpa+BXcD2GdhvoFmxjiCkSoxXc6v/ssbJnaa8+umywahI20laEK
	3vxbWg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8t8bq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 10:27:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a18178713cso17038066d6.3
        for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 03:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775557631; x=1776162431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CJ2YM48Z+WEEP7jumahO4mqpHrMt/fCy33Bct9rpYnw=;
        b=Xfekwt8a1/WtVoSxqscHnwGHaShjMhSX8D5BvTsTSJhEN9Sa9lWhFeBLYyRJJmGH4i
         mVyLbgm/nnpl17Pn/dhpec1o/yLz2QZHHqo3kVXPQuUSeF64NAF1aLROpAAcRrms6FyP
         MPcbmsKQ8RuUOaSVrApJsCz1YbgqBExTwNtFV0xRVBTGModShp1rtlHdT9ZXvDV4/LTp
         tg4kJKhKVjkSSstYGvcEEYJ7LPMnmGCh/r7MPpA5AVTQRM/N0pJXlxdFwbOroQI/iBoX
         VDajHDsH+qBqLxDIlJU1KZIwu8akAuXzvWZ2R0Z7ERe1JeeIrTr8o73PWOl5ZjA5ym2m
         M7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557631; x=1776162431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJ2YM48Z+WEEP7jumahO4mqpHrMt/fCy33Bct9rpYnw=;
        b=Vore/FLxFUuKvZedi4QAs+bCo1E/nHQTodSDYRVTjCfQMTKoAnFYCHis4xPIv++TgU
         peWXicmB1dD8pVG36TUN1Mp4c9M5Cl01cA69j3jglAiTp47+8b6+mdcT4GXU35dBlD/A
         hQn7e38UcyJgu7B4Zl6bUWb3/djkVw+wk6MdC2sKvWYOYWrnJym0qWeQM5JDMEK6usBn
         dq6Zmp5OUlcAq1g3s2FQwxG1hs6iTJOKFmaIcKnLfNHyyNKspx4oMljzxar8Bxv9M7gk
         D55HCkr6Dz4fcM+F++y/rZskk6LYVKR5oRdK9bboWmdiGktJxqbiFwQ1Mn5BFEL8jEC8
         VLVg==
X-Forwarded-Encrypted: i=1; AJvYcCX2uR+84gXDerF6Dnv4b63IW+c9tRM+ikMdPTdRvDJeZ24VEyyIyPU21zELVIeoOB79ksUioIG0wOxRxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJZ9C1qLjg71d5t7kvRcvyNwJva97Jp8aUo7ExA3cUeIPLWmub
	rWOx1fsrrsYX4oIrFwwqYS/Z3YS9J47sWDsHQlJeaEiK7dYAaWzEQ8w1bLLeMkWS9JEstUxir21
	31LEzskEnxa8n5Lpqj6cUcy575lYFbDe7FS2AowRp4taWeTgPWnnPkOpkYcUT3Rv7dQ==
X-Gm-Gg: AeBDietcTLyDw7BDw5LTQ1pDsCm3GktuDrfA5ujot4XC+2NOoi1Ig7R/fbmMxvSQG/p
	AOEXWlrg305OMWn+ddXGpUEds9jyatwZnRXQEIofw4VyTgUfaeeZa+fxn9/u2mNm/qq+MhA2mJG
	GijFefAZZWMOyT0ZxU0MBVTbCGQWEhQuQ8NkNlg8lN905PDpx78zr/6ijIx2mMvG2smJxBuvAC2
	3ynwBcu+3y0S2U+LH8iJQZ4U/o2Og4o10AB6YMRdaiJ2oFsMUFzPqRVzcN4nuaNFZBRgYR+2xDh
	Dnkc1hz0qlPuL2rI9Wkp2mxyBTqvDM3WJeJ6EGRPbpGCuJiaRot0Le0UpJrFnIK7iWgf0KXyQcu
	SFYZC8RvcMhCHP6jkjKpoOXWFQj7lT7TGBxxiOOONNZsZO99Kb8rIWiBDaQ7a1nascDseOgDwG8
	8WB50=
X-Received: by 2002:a05:6214:e4f:b0:89c:5fbe:cc5b with SMTP id 6a1803df08f44-8a6fefbcb68mr192040796d6.0.1775557631056;
        Tue, 07 Apr 2026 03:27:11 -0700 (PDT)
X-Received: by 2002:a05:6214:e4f:b0:89c:5fbe:cc5b with SMTP id 6a1803df08f44-8a6fefbcb68mr192040476d6.0.1775557630576;
        Tue, 07 Apr 2026 03:27:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec5c16sm538210066b.40.2026.04.07.03.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:27:09 -0700 (PDT)
Message-ID: <42f82377-c30f-4cf3-a57d-9c85d9c54053@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:27:07 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
To: alex@me.ssier.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org
References: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
 <20260406-m8-dts-additions-v2-1-c4c4bd50af48@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406-m8-dts-additions-v2-1-c4c4bd50af48@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: O7Ru7l6cPlmZ8K90KJYg6mpiPcPfpDRF
X-Proofpoint-ORIG-GUID: O7Ru7l6cPlmZ8K90KJYg6mpiPcPfpDRF
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d4dc00 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=8poMKPHdAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uSwIeAtNGuuqP4oK1qMA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=fyZPtLC9JlAwSkJ5-iUD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NyBTYWx0ZWRfXwl0wlwsQ9oH1
 xzN1YRn+ykHT/vdSvNSaWVtGn2nsMQzuA6JkktHDRpxpZXzo/nnVif3bsiNxAZ8ezUfyubLwrav
 DRp9cZdTlwml7UUkNeAkQz5wOtAAkec1IGqcTWHBQkrbLOsiJM02VUJzPvK4rlzy+xEndyKesPm
 VICrSaXkaJz+tbv5OtHfKtTDOmy46A3+QSVK3BMQhLm2movHGfTT2SCtIUi2WjfsvYAIdS56J+q
 SGwtQ5KQpflILxXoIwrO7GMlR1visQMD/Xs1DqOXz7crgPoNOV334dvEbSjOVLBwhBFB0pLnG8/
 BWTK8olfH/ftLfNVysqLjL/UnEmE0cN7Tf19nxEmdZ8506gEa1zKWiqOMoLuQGpBbSDeOfM8z/v
 ArbgS9q4p0cCs3A7RL4v5xfVjy6f71x8w93Jzo1r7qRjRKmfrJwieAs1jPlu7eL5ZfYIa2gccx+
 vj6lrM/g4xTBIVD1nRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070097

On 4/6/26 7:16 AM, Alexandre Messier via B4 Relay wrote:
> From: Alexandre Messier <alex@me.ssier.org>
> 
> Add support for the notification LEDs on the HTC One M8.
> 
> Two LEDs are available, one orange and one green. Together,
> they both form a single notification source, so use a
> multicolor LED node to describe this arrangement.
> 
> Cc: Lee Jones <lee@kernel.org>
> Cc: Pavel Machek <pavel@kernel.org>
> Cc: linux-leds@vger.kernel.org
> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
