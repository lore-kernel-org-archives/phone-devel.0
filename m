Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4E95223
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 14:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750860192; cv=none; b=NWyfcJb3vDqY99Rk696PS6KH8/oqWa0sNUHG+NSUgiOzxOzuG06ZxmsVXRra1QsHvqx8cg1aU0VFPQ69TFFwoYy7NMjnuYnCAK2gYva5IWd9Qpfsw54iRHtFdjpCQAb9MofdAD1OD1nAwHQmTLPGXHOqNw4UWFPA7VUbZNrD+P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750860192; c=relaxed/simple;
	bh=5zMJXwwWW08GGXTySP2knMOGm23otbDvAH32Yql1p7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZIKnBmLU6ejKhuABxpZNlwTnk+v11DJdSzVVgdSy44L3qiTKwqfB77RAlu6UZF7Nv1UDa3/pbbrmuhqfpB3+nB/d0rzyF7hhMf+N2JvEavm018/sEdJsDC7UbVI+Fbvs31I1IDTwnEki5NvZLds3CZB/x3FGDyPtaeHYb32GSdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4cMehir; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4cMehir"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBrJw2021010
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 14:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XFqnMVGRQpupfxD1RJ2vO64N/c6NtFXjip6hXI1/5Fc=; b=X4cMehirXtoXBVvk
	ABmJsgAVU1YrN1uzZ6MEUfYF9AjNbW4SRjuWooTtKuxPC08owya/wc/Ckcyn+W8c
	OVOQ0H2BfBGrhgvhlX0VXyTiKmW1nsD+xNsyLqLuJy0edGOtiFXIK19qvKw86ZAj
	fcdo6v5zEd2tJX9qVdC+0rYnGPTxm+l0hTSE9T996loTAcNuGhLItlIB6mk+Zpoq
	FtsMDXw9IRBU7XSb5F4dyKD1G7g3hbMdXNGScjC6rtUasl+tokn1kXKiYoGt+b4U
	VwlzAo4aCBIRAyS3h/kjvHW6TGi8v1zUvzalSjARgzEZj9N22tLApLFw6QN53eJ9
	fFoFqg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwxd80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 14:03:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d21080c26fso164878885a.1
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 07:03:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750860189; x=1751464989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XFqnMVGRQpupfxD1RJ2vO64N/c6NtFXjip6hXI1/5Fc=;
        b=C2ICNqWf3g8aWAV60YoafkYEGcOiX8T8ioDvera6QfH6GkazNQjUQr3g87IPX7kxFj
         /4XqQh1bnWiL93XX+1vPugECXqAcDQJmFXrGeisQrvjgVCm3LqVMVjfN7l71hUECdvdz
         rqerJ9NdZTGNXgAxI3npUZqSdrljtDTk0NOid0w25xC/lNrJ6q/8ays6MhVZh61/NDdq
         HVw1dCis5ZNJyp6iXRGpJhXAqOSICHI1dGIT8Fwc12PyJGiYyAOhalGPTWxwxK/OruLZ
         zNcWfO0tBfbz9/AplzJIoTLC8v1ihVemSFPYHb7AuSPrXIfTeEezPOWCor5gVTTOELfp
         CFcw==
X-Forwarded-Encrypted: i=1; AJvYcCVsqPpsKlVRcofWNDlq4w/Ei1gNk07V+uWPI3KYaT62LfRvcC2s0LZP/5ZzCDY5FWa0MDWLGc+G4ddYTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCsaNSG5hFutsRFCGehwiIB6b2wxggDYgDB6+Y+I1SZDncFb9+
	CcyIVqbuVFXKFGVVktGP3Am8CmJYwrNhZXEFc6ye1QQ1t3M0Na+q6FCz7Ks16THSAOGTK94x1yy
	Rj+q1BBcUdVN1vAUA2eii5mJgKD4tnaXqGWoW/rwKaIh/u3MQuBHMNa2lWRTz5q0GeQ==
X-Gm-Gg: ASbGnct2terNgY25HkfjYl+I2JXiyviFDW/aFd1SFmSIAu3GqJ/3ndWaTnp7b45mkoY
	YiDrE8TOVDQB4c7nMEOWgDWvRPeINzPOAcZsHQyVDHxMsiH0DosvyxOhTiudPqCWRUyYarVnlT4
	w/YwppF0r3ytebySufe3h1ttgAFNLdXZGA3QUtnuVVYeNwgbuBCLkN5XK/VNx0fGwLhjvVYn++a
	S8Yoo3epoY99I85VEBGRAWuCrla4C7vOYGf4quXF6u2S8+rylCXLgT8fWo7Oh3jhxyPF5Giji8N
	+TIzL7touu4InKDkzkRWaW+0WM6JRcWEyrWVGi9J8S5Q4aw+9k3A8zNq2XzISuWjeUVwFTzjxDC
	+9ck=
X-Received: by 2002:a05:620a:1b89:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d4297074cfmr151197085a.6.1750860188785;
        Wed, 25 Jun 2025 07:03:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdIBsWsp4TsebQh9ea0CxfPNx1LapgZvLTSmHhJ3o+vsH2NNt9o3OqUtv9riIIP+wKvxF8wQ==
X-Received: by 2002:a05:620a:1b89:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d4297074cfmr151193085a.6.1750860188053;
        Wed, 25 Jun 2025 07:03:08 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209ad2sm1067888966b.148.2025.06.25.07.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 07:03:06 -0700 (PDT)
Message-ID: <8ed0cca0-c2ed-47b9-b2e0-bbd66e133f78@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 16:03:04 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] regulator: qcom-rpmh: add support for pmr735b
 regulators
To: Luca Weiss <luca.weiss@fairphone.com>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250625-pm7550-pmr735b-rpmh-regs-v1-0-cab8ef2e5c92@fairphone.com>
 <20250625-pm7550-pmr735b-rpmh-regs-v1-3-cab8ef2e5c92@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-pm7550-pmr735b-rpmh-regs-v1-3-cab8ef2e5c92@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2R6sNGGxuX87nCfqgBARrEr2agb7GxRU
X-Proofpoint-ORIG-GUID: 2R6sNGGxuX87nCfqgBARrEr2agb7GxRU
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685c019d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=FIv874YiPNcmhJNsip8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwMSBTYWx0ZWRfX7CgPxgNVBlZt
 3ZrcAWeJw6iazy6tZY+2Id+xfmwd40BEgrKlp6fYXwEarJSyFEkM/sNsc4hvvcGKizSUHDCaUfp
 u4Uoz/soqi9GXFuX5oVieLqA5X1jyjaIlEZXq3LcAzxCRBGPyyGzXHhYdAGsWVgjidD1wEdwq1S
 T52HgS4sP81bQgh70DT9AbhmINd/8cw4fQ5Z/dMoKMltwfGELU5oGC/HjrBKqlxVVzBHob5RYOE
 1h7gAl/C3cjhxvyFr4TPKtDuME5A/ho7OwPw7ds5FxH9j2dJ6mBv2pemWaJp4QCvKN2FuSotlB8
 KZLHB0aIUGRhekxnQG5kAY0D6ghP+JiFKlOd116M9cfAJS52EiCdlKtybMF+acPrcfUerB73CPq
 gQCP6eP1sjd7dBlKm+RVA8nD7jdif9GvR3vBVMmN9kYBRH6usMWqWIpiv2VP9AryudZIVj7m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=984 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250101

On 6/25/25 11:18 AM, Luca Weiss wrote:
> Add RPMH regulators exposed by Qualcomm Technologies, Inc. PMR735B PMIC.
> It has 12 LDOs with 2 different types, L4 & L10 are LDO512 LV PMOS
> and the rest are LDO512 NMOS.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

As far as I can tell, this is in order

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
