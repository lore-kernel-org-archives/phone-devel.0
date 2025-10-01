Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC4B27A465
	for <phone-devel@vger.kernel.org>; Wed,  1 Oct 2025 08:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307205; cv=none; b=Dj0eZtkkiEvWa4r1NIFwyqMo16rtHjfsx+fQoNjKfdznDvvsJZhc2p7Eh3ytLdUjwAEEoYmA+3jwYTmTnAZKe/evOA+HWNpQd7lgbM6ZAbjPlnVUQjbpzIDha5+R7/hLj0c/fdDmJjl4vtaDDvwEbxpEtv5tc4wJ+nk8eHhPbuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307205; c=relaxed/simple;
	bh=YO6u26nFzlPOkPOOXGthr8BF1ZfQylY9VojhkWegnB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P1WNJpRZClstmiiHi+YjOZEUH/OS+zOLWfre+XIKWb/9KAJ6QEQrw6PC6eEbkCN7v9w+qbIFhBMGLhLL2PdOtOpGGVuYzNWtPvqdtUgs5LN5Yqc0vEnbnP/GnRK0kAlpYo+wL4Lar+haQMHz9h6x/ZWozOVaLEIHzwlVsHCIgHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cPeC22l3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cPeC22l3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UKoq2n016883
	for <phone-devel@vger.kernel.org>; Wed, 1 Oct 2025 08:26:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mlCMGBeTBT6Wlu0Hvmm3aAKB1BK/Vj2tfJ0fRSaoa2U=; b=cPeC22l37gZgPeGa
	oPnbj1Yq4shDQsFs+3DjmuycIEK94gGCXqcYbBluNgA/dyKETdYShxoWUoxbpNSF
	3zO9XsXzrWaaqF0l/kn/7ppPuwOmT4r2OCHXPr/NyqIHhsReMbrAiaiY3ydKhv22
	/V4Wd99EEOBBf+bkXVyvVeIwBTa1PwXoSXFejBsLfjVvWwGDfnsK0rVAPxmB80lK
	SCaMhFzhuDKtL6PLr2D2DusSi91vTIVwQU581Tf2R39h5QdDqBg8EUjzA/szmxFa
	dG1yl7jxnGQNyfLFCAsldjaJ6FtVoEXV7px3yfdJYCaaDxyL33W4w0v/q7pWmVvo
	h41Vjg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hkjk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 08:26:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4dee3f74920so14237971cf.3
        for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 01:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307202; x=1759912002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mlCMGBeTBT6Wlu0Hvmm3aAKB1BK/Vj2tfJ0fRSaoa2U=;
        b=DsDcKYGgxgmBdu2EOR0yFVfdY/VmiNtjgs7mC51aMAJCV4VMgPSGdRhFUthbnC9mzo
         nFw+Z/SJj8F10bjMI5MdwfKWqJwZi5uoKP07rHPg3VIVCQZug4wWbYp41A2W+MUjfuDJ
         nZgv1X4VQVF5r4Eu4Rdn8w1UUWamMOja4rF2Kg5DqmgEssojk03yu3KjzGUYiAwuMf8Z
         R2NnHM8GVyBeQ7u00qk2JPI8qTS2CVl0BzJhsKfj2dvFMluS0zJaBNhlj0wpVmCIWzX/
         mpUMQNUdGJ/w6aUUONbQlz2jt0g735R+HkiCFoY0LSG2ftnb5XxeOmfh5pj/6fjbP1QJ
         tI0w==
X-Forwarded-Encrypted: i=1; AJvYcCWdQ0u+XIdKaEWFakA+4kZOcTegrVE8yxgw5uBSxdR7xp+h7PAQgpX5OiKD2gNAxSOmWCfGQgJJfu4hWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvcYAGeHCuXNAwF6AuBmaZya9DT+NPowAFy9APPnL1yPuT+Siv
	oGcrVHl+kL4yvDD50+DjCRIkse/es3MOX7Y68+vVqlPfERZYnd8zPVxZMoiKITxab8ZeXLgpebp
	cM9Sk1zUoGHopcw9+o1g5bSKKt5EY5jDnXmeBeRE3H5oszENJUBpRtvgPj3bwZWTMxg==
X-Gm-Gg: ASbGncuLS6/hQKkGCeGYO/M/h+Qw0iIVNN2XqnIFrrY5cYotRdBPT6P/x1V21LWWfxB
	REGR8SqLJe5oeKGK0z60vAP4OCXNtVLwGDliQYma2al5sJMLM+gY1NAor5IrPs1N+FAvrpHlU4D
	QDhO8kRLI2ocP5KODkTE6tTw2RfEFGpH5w+R04u2bAFxRSZ+1CtDKCMc3VWvMgVCbWiW88FOqqP
	SMZMrGEV5fAirovhKS8TZ1nfDRYfVNNPhr5prHCa1b98vBgrZpub9XoXnEaliRiFRpfUcztnSRS
	rxVghOzFlxGvWzPw/y70uP1J97k6QuoHgLcVFT5OZbqAiWn+THyhIKaYOF8IwhCKFJvynPH/93B
	vXuP/6A14XEjKmusBtWH6CV2Nnkw=
X-Received: by 2002:ac8:5842:0:b0:4b7:aa56:c0f8 with SMTP id d75a77b69052e-4e41c5460bemr23012091cf.4.1759307202157;
        Wed, 01 Oct 2025 01:26:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqJd90oNLdMpoZhb4jGAg5bwDcTi/Jv7Qcxlk9kT5t8J+o925AOCw315gte5BBxsiD/DLshA==
X-Received: by 2002:ac8:5842:0:b0:4b7:aa56:c0f8 with SMTP id d75a77b69052e-4e41c5460bemr23011991cf.4.1759307201702;
        Wed, 01 Oct 2025 01:26:41 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3df8c7aef1sm652456866b.11.2025.10.01.01.26.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:26:41 -0700 (PDT)
Message-ID: <687b4b99-287f-46f3-af07-76b49cf573c9@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 10:26:38 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm64: dts: qcom: qcm6490-shift-otter: Remove thermal
 zone polling delays
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
References: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
 <20250930-otter-further-bringup-v1-2-7fe66f653900@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930-otter-further-bringup-v1-2-7fe66f653900@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX6/TyL21JIPmb
 9/Zg9t3tajgQWh2uUTA8HX2bl4OycVG0OP3cljoe10Iz5hQBJ6hE7zGB1cn7IbNp4O4gsdd6giG
 MzEDPBvoQra7cxPjq6bvbVlQl0uC/SWAF4QpbJ1kFa46W0jntpgCjS8BwH8ioatf1QFggQOlwdc
 yxLrfOnzwb3x8k08bDoyRXsKdrrIyZ7A2qDxCQDDSuqbp7p9PGR1giYwmKlE5raNb8Dxu/UIR1W
 JjL3xoVqQ2g51QcFdroOCl71fE42Du43ruDjJuNybvmH8AbXlzAJLDXNpOYOzEVx3IaKzHANXk+
 k+LXCqdd01DYYjj2EfW6XFTjSkwpyJrS5lKY96I9Q4B5TsLn3h6sn8x+nDkFAToAWAI3JamGT20
 ae3ipWx8NQfr+C+d6fnmr18pMuTg1A==
X-Proofpoint-GUID: jHHPUv1SVg41YSzZ6yTiMU29Pq-8egVB
X-Proofpoint-ORIG-GUID: jHHPUv1SVg41YSzZ6yTiMU29Pq-8egVB
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68dce5c3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=7Ovdx5uLAAAA:8 a=Q9X1YL7jsAXwpJAzmCoA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TQZWkJv5rNK5-PaLMsrg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041

On 9/30/25 4:32 PM, Luca Weiss wrote:
> From: Alexander Martinz <amartinz@shiftphones.com>
> 
> As with all other devices in commit 7747a49db7e5 ("arm64: dts: qcom:
> sc7280-*: Remove thermal zone polling delays"), apply the same change to
> this device.

Your passive delays are <0> too (which has been the default value if
absent for a while) - IIRC you don't need either if you just want
userland temperature reporting, but you may need/want it if you hook
up any cooling devices

Konrad
