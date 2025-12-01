Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FA7309F13
	for <phone-devel@vger.kernel.org>; Mon,  1 Dec 2025 12:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764593319; cv=none; b=imO2m/0LMWyxt1UKcmGdDpMxvj3FzK6NtbdXnrnNEvW7q9lr91QA1GaA/lYlCmO6wVxtXa8E7dJcYSTO5OeYEk85ovuFx+0Bo5GSbDXl5gJeqT7E7MgRpZTOW0/y9X0hyaosfVcr4fSz3K5mHCu9M193G9vLuwGvZg/683kJK7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764593319; c=relaxed/simple;
	bh=qAHaFUAElk7/jopPzD+/mdf1FarzhhYUTTKZK/63yN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ECZyT25cWHC4bvDobVKDnFJTEhn8yWJ0CFTGJsb6ldiiwzYJ4m9YhuB4Wx20gQdHM1EQEdRVugBeIgWTdfDIHI4nBWbpWqt9kbdT2hjV3cBNufxBVWfzyq9ObCfn/VgtplGcSoLgEOjunElDj5lMKkT9+SJGlRBajfxpUzDVqpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wt1D9rQf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VGCEeRA5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wt1D9rQf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VGCEeRA5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1B6cu0399065
	for <phone-devel@vger.kernel.org>; Mon, 1 Dec 2025 12:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31Lr3ce7GGqaTRhfeak+RVWxiplPSWjZJKKcGxNvE7A=; b=Wt1D9rQfQsZTKjyW
	xsVtXzItW2zWdLhVKwk27nRz4SmxXN1yuAomNZdLopvEQUibMspO17XKMFJurOWb
	Byh4hlsw+Z0XHXDyiCy23uFTMoMOVnhPBihGfSM7kHUDexpw+sY4JSabR9qrvXIX
	YYanXrN+KsiCeW05QkTbmML7ydBklszAE7mO6VBslxCrNO+nnGM4nvfyvkXcWzu5
	RQ1v89lKH6XXCt+j5E5jcBKZPsEePhKV8gJ83aRorcRDkR8qtnY9eXhQfguBb1D9
	WVJgt52f8bAgYHG2zntkkfRBDWqc8MgrpRojFv+YWnMlrDypYbeIbfMhvmBfuaCI
	x/dMHQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as9ug08w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 01 Dec 2025 12:48:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee23b6b6fdso9749061cf.0
        for <phone-devel@vger.kernel.org>; Mon, 01 Dec 2025 04:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764593316; x=1765198116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=31Lr3ce7GGqaTRhfeak+RVWxiplPSWjZJKKcGxNvE7A=;
        b=VGCEeRA5dOwuHsjOOV4RA/0E5Yl0e/r32PpZbVfyBhhckEajWWH1Lb0jh1gp/4bV2Q
         YOtLBMtjkjEB/iEpFmbdn4MwyZioxPxMLJipfZ90jzKbtasFCcEBs5dCUxBmZSfFhTmh
         UFtvLhIoqk2vl3OmUSKRQpyx4766weRvEYGX+P1JXFl22p4kfCqOJ5QRTbqntF0W0Bnj
         OrgP5XWfQIrwyEfKRnTNGHq5nOkiwNH+pjXlz2YDYN8y+1NHIwya0PQAcv3nN20+XXzq
         VhinkCPo1//SRK2hFOmU/EMwfKuOY/7kQ0mpkrKj5FJN2R9lN3z1OYPdUcl4iiqfUPcM
         H9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764593316; x=1765198116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31Lr3ce7GGqaTRhfeak+RVWxiplPSWjZJKKcGxNvE7A=;
        b=ocwsjHTbFlA32zPPnKTnpH6fE4cHaUO+zPi+/Pwlv/yPElx8hPZI9BbQqzsMdlS7YS
         CDDG9cAUGfG57IxUZigfLotxGbjh0xyPp24Z0b+HEsmirhd2ydopar48UmWIZJW0blLS
         pq5UjmjPx96691HSVzMcMoXLPWckPCKuUrmuEUNLH9ma8YMHMBromJGRbp5ROmzCDMGh
         sAbOsfhVeLhtAcYmQgn0B+EOF/qut6QdefUFRxc3+tSDEMTZad/HutS01iF8isVdS2jb
         2dsHeXg3GSswawtaGjcfH+/ncP6Gp1m6yvFbFrkC3GfOKYqsxHjKM74gHq0tSiO6cMMK
         e22Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwGbK1EKjRpOMKiXnri9CMsBx9b/LlpaiDA43tAd43Q7pm6u2NqTgIIR7otwvkHxlRPYPKfXSUMMVYaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhs/l6KGQjsI8YAt/u6HeT+q0RVjne8vLL64hOF5KsTnt7TgB6
	I7NYZlf3cEO88TC56RrwZNAVrm7JbeEG4ddQDolHoMbGen9F1kmOKN1CShtTrsu3vasLV99bz2t
	jz3Q/HvLu54ryX90ZD1wR+i/ivQoSvZXhguK3rtxQghobVshe+mY+A0sXalbtM64k/w==
X-Gm-Gg: ASbGncvzIxEbCENUaM8JiXy7lZj4291ATrVFVOuFnf+Hm56MbOJSEYLaEAuN0Uau+1+
	FeUxVVNseQkZ/sUXtxzyaFlggcj+B5/uGg5Df5j1YQHeecIOELsFVUfwj3YRb9YbCx6bim9EvMB
	UenNos5aLRtCIx9WtQ0buVqtMgk/Ygj9G/g2qmXtWoweukXZJmZxYEgH+fGeKJ+UqBE7mUeiqXe
	iPYz5KppYmd9l8oNLArnx4z2YTF4cfSMSqq2EENXS2spYYS2TNnnTJY18cbnIdBjUDGuuvwLxjJ
	laUTbI1W+FFeYS50t6XHajwJ4jn3qgCoJEQsiJcAxETRzMMAvbKVO35dp2QVVlw2h/MhslAPSvL
	EX5mB/R1cXELPLMOpq4BgOiHLN5jFsVdEhdzQhf5IiDeqpg9xNmL0puu3jpmwiR60jhQ=
X-Received: by 2002:a05:622a:1184:b0:4ed:afb4:5e30 with SMTP id d75a77b69052e-4ee5895624cmr419914341cf.11.1764593316152;
        Mon, 01 Dec 2025 04:48:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEm7ZEX2gV3I745dgmxGg4UIToSiI/z143Wd93/fuoI9uQxffD0Ca16doOxKPxwTjvkLFo0ag==
X-Received: by 2002:a05:622a:1184:b0:4ed:afb4:5e30 with SMTP id d75a77b69052e-4ee5895624cmr419914051cf.11.1764593315786;
        Mon, 01 Dec 2025 04:48:35 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59a695esm1190842866b.33.2025.12.01.04.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 04:48:35 -0800 (PST)
Message-ID: <3fcfc5b8-7509-4e4c-a1cd-e973d7e1d091@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 13:48:33 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: labibb is not used on
 OnePlus 6/6T
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251130-oneplus-labibb-v1-1-bb3653e43120@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251130-oneplus-labibb-v1-1-bb3653e43120@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwNCBTYWx0ZWRfX3SExrFB4B8yG
 Wx6idQBymd2Q23CeTXW/3TLiNi7uomITzznbAIpvGafYn7UTk0RIGzZNgwcpnQg45JuKFS2WM2E
 v1YeUb7dmTFAYlGk+fw5GOrHoVpu8nzVDIwXQUlXzDPiFGqKOUuLtsMN8gk2C6CE1jQMGMD71P4
 4FVJUc2YYgb0kwfWA1gflpr3SObq55kKl6NVowahQJnVyECCzTPw8TAUbBR19ymCBTLj0iDcOsS
 FLMrzmUCMcsLd5JZBsgWkokMzbIdQnXzK8qmX2nXKD4k+0W89R7Rvoe8+1dbTZ4PlvWW/j6lj9K
 KKs6IzcHqjgkoqzD7NmEbf4jwiPLwlr3TuMzZWOssqPjHUXg0mLx1eJ+kgRof1oiQtLNnMob5TY
 tqVURdumFZYTsbI4IRtwwmjfBuWpGA==
X-Proofpoint-GUID: O9_ozfHECV7dLLU8hdgtfaI_7q92Q_1w
X-Proofpoint-ORIG-GUID: O9_ozfHECV7dLLU8hdgtfaI_7q92Q_1w
X-Authority-Analysis: v=2.4 cv=EunfbCcA c=1 sm=1 tr=0 ts=692d8ea4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e__-_AqODaZNEJG0dXkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010104

On 11/30/25 1:08 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The lab and ibb regulators aren't used here. Disable them.
> 
> Removes following warnings:
> qcom-lab-ibb-regulator c440000.spmi:pmic@3:labibb: Failed to create device link (0x180) with supplier c440000.spmi for /soc@0/spmi@c440000/pmic@3/labibb/lab
> qcom-lab-ibb-regulator c440000.spmi:pmic@3:labibb: Failed to create device link (0x180) with supplier c440000.spmi for /soc@0/spmi@c440000/pmic@3/labibb/ibb

These are only vaguely related, as there's nothing to be wary about that's
specific to these devices - it's just devlink being grumpy

> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> I assume this is right approach, as OLEDs on both devices are driven by
> different regulators.
> 
> Question is, if should be labibb nodes enabled by default?

They're onboard. I'd rather keep them predictably parked than left in
whatever (potentially ON) state the bootloader may leave them at

Konrad
