Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0102D3225
	for <phone-devel@vger.kernel.org>; Thu,  9 Oct 2025 09:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760002585; cv=none; b=hcLLFD88qmlQ81oilBCPEHqQlVHEYK72gdahEzFJ564NYUdof6QpUKBQOiPiTVsT8tPJk/OOcgmZekJeWTZpHnm6lKoFibpzEHvGKzEZfrfvmVSBFxWeuykXI1NKwzf/SwJy9fWY67if+3lwvMaCvDwyxKrMaQEp46+7wkm2VRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760002585; c=relaxed/simple;
	bh=gfxmdc0fvddAxG4b/OJJKinGY5tgGDXqj+bN4HMO/MU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ddSHfvLKsDmcJcMkJL1snbCZY/rqVVSm0jkD8R3BWVmo420HW8NzPoVwWYIxxNBPsUplo0UuSdB14AQRsWRByKrTGTWiiRYgcD6339fFHwcJ/rrNHKaasRmQvuhIfzuHhRohJotYH2gx1b63ClEQulZXMxBJCvPtQNdMMv7w0nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=chGpUj2Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="chGpUj2Y"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EOwc010843
	for <phone-devel@vger.kernel.org>; Thu, 9 Oct 2025 09:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZlENfdV3NK35Sf3xLY1YxG11Zkc9wWwP7JbbV+drP6A=; b=chGpUj2YCMy3ZVAn
	kDhkvrgRbb9lsz7nO5BGZLYpXfCmUn2Liu5uHm6Hjc85VZV+4eYGLKxwCMJJrF4j
	+znwDfsIXEMAg88geZDDAd7ZRSwQ8y5lD27g/XeVRdzkegxTnMHoPYrcQgWXGyhX
	AHTMD3Fbl3QH0jQAWGWzZg+xgBQ7elMU6w6BzMEfaMHLjAc4tkii5mUblEEfpW/0
	lPVZtT2SbM1LhxBLARTjGj6NNhIAywG4PKHmX4QvzrYicFUTCBJvU8+OCMvdtunD
	yfVo/AX6no8BIRCY5JbVv6XBc3g3rnQJX3rcHQU03ZAscjw/Gt2l1OBST1nVGx5y
	/r+/XQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv9aa8m7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 09:36:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d880ce17bbso1550421cf.0
        for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 02:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760002582; x=1760607382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlENfdV3NK35Sf3xLY1YxG11Zkc9wWwP7JbbV+drP6A=;
        b=Zbti3cWmLv0listAGh5tESbMBfzFYWrhpHbg0Q+b+Hi6urKOr9/NnG1vopW/eqc2K7
         IJKLobv7X5yDD8u2gMkHt0aoQKXe7UUMbjy89Z67d9mWrMf4Lz+Q6M7mTSeOKkTvNwKX
         B9gLCaRNRhWRe4eerTwBSJ+p/669BrbgibMO4jGzwIslTjlWozXnVEl1YiPvlyQvQDuJ
         qVKaycb2dxHn/pCDR/IpgqIA2sGA+ix5wGD1x1QL4tVWRMyZTQybJWM9TA4SIBjJOb2p
         KqLrQVTITJW3+uySPdyPoZ5vp82/6zCBEZ6HHMbti1q5dDb0Qei/Kpk5kiSJTKgPKHHh
         3g4g==
X-Forwarded-Encrypted: i=1; AJvYcCUJFINvsd509QUH75sfZmajvB47gZ2yyFXtQn8gFOIXIaGo616ZRIUc8SpG9VYe0LKJmuW3kHEjn0mUzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjrRtm5QIC6Yb/hLoB0pNPdkiq9RfOhWoZnaQ3rpXcSOBpXamC
	+A4+65gRoMJlp9GD7TlROt0EHgovpH5y3+60istRl3m/shSZmK1ZIpjoKy3Fcc8nJFFicU0xjg6
	mIMrw6mbywYvnWSl3yJeqt+b3LIhx5f/fnJBN3gDskDteEBXr0H6Xylit9GGxN/mqRg==
X-Gm-Gg: ASbGncsX98FCRNSIgrxxa2oYDN3feCEyjagBkae/7OFbm5c01U1dfJQvloP1gdWzFb1
	5rzqT0cPHVuoQy2/9yEy+Kjf9eKfBtRLoNJc59izF9ARFLHdRquU3jysR7DHr/m9i8JBFSoKPQ4
	kqhRw6rP9pZ34sA04ERd6GyKUKAoUO4xeLPyFopn8M1eH5U8pe0xsDEROGgputh6ohBqoX7XhyU
	Y8ceF/xSFSRU0LjvMW/esCzq6r6x/MulqwxsAPkctH7Epb0J1ALMvI1QSfsUH9dr1eoE0+yHVYe
	T4r1lg1M1IddytaZ31xuLlCygbbQaVb9lg44F9vS89TJST3o0o6+ZghmFm2DZ3xWSzqvnl/Ldd4
	wBqz0ky6PBEP5pGgp/cxOh3Vy08M=
X-Received: by 2002:a05:622a:587:b0:4d9:c572:f9b3 with SMTP id d75a77b69052e-4e6ead21584mr61468451cf.9.1760002582484;
        Thu, 09 Oct 2025 02:36:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFswHdiOJUwRiwcv4uyVPagNLLBplb9cULvTlYReU61ImKDfBFX8j1A++FhoIl/DoaD+NWcOQ==
X-Received: by 2002:a05:622a:587:b0:4d9:c572:f9b3 with SMTP id d75a77b69052e-4e6ead21584mr61468221cf.9.1760002582059;
        Thu, 09 Oct 2025 02:36:22 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4f3c7e057dsm707731266b.88.2025.10.09.02.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 02:36:21 -0700 (PDT)
Message-ID: <d9d4171f-98cd-4e5b-862c-5711da8abf63@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 11:36:19 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: qcm6490-shift-otter: Remove
 thermal zone polling delays
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
 <20251009-otter-further-bringup-v2-2-5bb2f4a02cea@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251009-otter-further-bringup-v2-2-5bb2f4a02cea@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMiBTYWx0ZWRfX+Tb/Fsul1LGT
 n9RkR67sScqj9sJUnzzMuq4aPwsbQsvbLXp4Qj3AxirI5uuFqpyI37FjOLYUaSMewSmytX2nbls
 k77ZzdY6KQDpkxxxp86IVROy6x8H9J1PMKomhmNSNsRYUr/90ubd4ENBG71JAtUU+vQch0Jh+yx
 ggWwoFHMUH96IoUV29egX7Q4NLJRSWUgles7Rluo1tuQv5am0CLSk8SozxjqlHrohr1OoseqvG+
 BAkArwX4FDAteozVBtKAyGapvkmZmrgY5p5MN0N6KB+5BtVjRE9X2sjpRoRTG5jKThO6kFLzusn
 HpehhHrSLXynnNzSX4WCdbAj101li0AaBr24YFRmz4dkiqyBwxoA9HeDlCNEIwIDbawYn/61GIc
 XB6FrAkflxpQOzxArTei6iEFRrF1Sw==
X-Proofpoint-GUID: X6oc43hvlRjX07QqlXayhjeO6Bzjro7l
X-Proofpoint-ORIG-GUID: X6oc43hvlRjX07QqlXayhjeO6Bzjro7l
X-Authority-Analysis: v=2.4 cv=JPk2csKb c=1 sm=1 tr=0 ts=68e78217 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=7Ovdx5uLAAAA:8 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=8Sbc7aUHQeoA2S8VE70A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TQZWkJv5rNK5-PaLMsrg:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080122

On 10/9/25 11:06 AM, Luca Weiss wrote:
> From: Alexander Martinz <amartinz@shiftphones.com>
> 
> As with all other devices in commit 7747a49db7e5 ("arm64: dts: qcom:
> sc7280-*: Remove thermal zone polling delays"), apply the same change to
> this device as the delays are assumed to be equal to "0" if not set.
> 
> Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
