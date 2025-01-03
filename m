Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99181F9EB9
	for <phone-devel@vger.kernel.org>; Fri,  3 Jan 2025 11:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735903825; cv=none; b=TrYJNyzplucZ8+NmXe26Iqm+k1C+b/nHLwvzB0xyiKcjA4N6RF9jpfmUaBQ6p7c/f0IFCV3EzIUGxcAOdZ7oxWiQH8ILtR8XCIw9I426fmOFysNkyFcVfJFWQLYE3lonUsiMgstEaepIHjdRAk63e57AMCamx6l158H75G0Vah8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735903825; c=relaxed/simple;
	bh=xIe09ebymTzrmNS3ehuwtU+HDBREWaPhxBx+WASpvJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=umeDSZ2pMKZ/KqlpLZqPls3SXAT6A6v0Qtn8+rXqL5otiXsKZ6XIUjFc0YVUb+5u+8+5TWYf5jrL07WSBDw35lZa48KRPhvmW9ADLK8RG0k0megB4lLwHoeGUKEAjYAcpwC0cnnRbsS8HNjSWDa2TCCKInlyqoOBacc2NmCj9u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a+dSub32; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a+dSub32"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5038KdsY010127
	for <phone-devel@vger.kernel.org>; Fri, 3 Jan 2025 11:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o2MRsFx3bMUSG9QzwttMjqbwl6vaosB+gmA/2Y/BBj8=; b=a+dSub32uRRJEQ48
	Qz5RsRK4oDN0DlX99oW7yw6XZ4xlb4mxu1Znf/G7AoMajJ86Zw4VLiklK6DgWvwa
	IbcuRwMK+7cXwkrIn1Rozz6kSvt1SnHrxSBaZh6j+qL6uZofSPQt0b5KLpwbR/C3
	788tpHNVDg0ynkLvaSFi8FYQWl1khoqnrfNxuepTPx38/tPnZx+quEqhGqdEXrs5
	qb+Z/qjTv2OZ0MKQXYuhvJ1Y86ZhWTyVV7KU2PEINRZP1r8fZgKYiZEYYgr069uY
	bcGSFz6BB915hC8ggydBwnZ0cibrgM2YkzYIndliFQvPpAMSv0pZNVoJe4AH2I44
	AGLlvQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xca50dkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 03 Jan 2025 11:30:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d8f15481bbso28649156d6.1
        for <phone-devel@vger.kernel.org>; Fri, 03 Jan 2025 03:30:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735903820; x=1736508620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o2MRsFx3bMUSG9QzwttMjqbwl6vaosB+gmA/2Y/BBj8=;
        b=KiXHpS+RX1YZd+ArBLmaaEra4T+gtPc1a6vmnVogX+ju6EULi+gcUX9+F6KYeIDUoz
         nrhrkGzYnhV9Nz86gF4WBl1ylPHJizA4u8/CKgga/fQo7SB40zwTpojg1QlfqcEdTCXO
         XtzLcjCuaqdGYchJgW1sLyViSkPQmJGpW+IBRrTEdNgrcq2J/M8IaWI6GTB1rDkMjUEu
         MLTGXFj3r9VZkApBH2EeMZhMm0OJTHYsvKfN+qJhlPOL+ZoWJpBSYi+xkB4m4Bh1J78V
         JblJ69YWdCWvpRpjTsgC6v/IpjoUmp5vOdfM/0RBUG0BH8SSubK2z6h+Wxqdr8gI+PCL
         /Y6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCk66JBfWSF8R13BsgdjjkSibDpPF4igtq0/fJ1eSMiezA1Ia9I/AS8TDL2bEGl9l2vgyUPoeIj7KZ9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBsHZfDi3XrhmI9xv6tTzD+9tm6pwR4+VZVRaByZvlM8F7jVCn
	v9dq3Tz4VnRG5bubbUgXuTUQqXP4iIXSydtRSlQ77yozjKifUmokEwt79c3qIv9QbIDagDYhJVr
	tzAmrtRLiic+QHT8rURFGE3uy5AdweT9uR53fAZZ9eorRygyPO4bwQg1/6QxMNqNldXTgXg==
X-Gm-Gg: ASbGncuDGABCgpTnTdWx82DkWQ8fQO85cQ/MpyeZPyRVHBQLskfkGdsA4S52m1uRep0
	KCrUyPlCppjXhV5GavgwvPUh58tL7aRREFx7ob21k4qYG2KLWLvLj5rSMLYvdCNF7wkGEWDFopf
	rvqry06Ifht8henTwC9RE3a4aXbyaF8PYnWyOJXot51RCnfPuYOBduxDWV21sGoeagV/nY6mU76
	d8aKC/DXAwU4TRNdmhuuiF90VhkABurszT38olVkxAE514KvyqUocbatC+/wFlgf1lU2ns6zGTu
	TRCBuAH54BTr7sZ2LAwS9hjy++Q9UUH2yBY=
X-Received: by 2002:a05:622a:1a03:b0:467:5eaf:7d23 with SMTP id d75a77b69052e-46a4a8bd016mr278472061cf.2.1735903820376;
        Fri, 03 Jan 2025 03:30:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6yfhfXdw6egYbhDHkpAKPnsfYJ/f65rP+b7aYP2oQNqtV105SjlWWqv3GWFFKMbv3p8e9EA==
X-Received: by 2002:a05:622a:1a03:b0:467:5eaf:7d23 with SMTP id d75a77b69052e-46a4a8bd016mr278471971cf.2.1735903819989;
        Fri, 03 Jan 2025 03:30:19 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f01285esm1888510066b.141.2025.01.03.03.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 03:30:19 -0800 (PST)
Message-ID: <1e224db1-04d0-45a6-b0e0-e43de7c7a0b4@oss.qualcomm.com>
Date: Fri, 3 Jan 2025 12:30:16 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable
 camera EEPROMs
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
 <20250103-fp5-cam-eeprom-v1-5-88dee1b36f8e@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250103-fp5-cam-eeprom-v1-5-88dee1b36f8e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JQTxIlR2muulKtWud6gpzYZfa_Ls-byA
X-Proofpoint-GUID: JQTxIlR2muulKtWud6gpzYZfa_Ls-byA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=882 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501030101

On 3.01.2025 12:12 PM, Luca Weiss wrote:
> Configure the EEPROMs which are found on the different camera sensors on
> this device.
> 
> The pull-up regulator for these I2C busses is vreg_l6p, the same supply
> that powers VCC of all the EEPROMs.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
