Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1865326E172
	for <phone-devel@vger.kernel.org>; Thu,  8 May 2025 14:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714600; cv=none; b=WBc3uzs2zMauCUGny41hmZbqGeIxpf9LrA4sBO/24dy0vmhoFI5IbW7ST5d2cC87mzoJ7aC3JRa+wz+kjOY7kv6bI1ViwPHZDKr7OaPV27F06AUsN/Bzd5xlVMgYVID3ib1fzRgpDHZ1r83KjW64yPv/lc9PP6zWfzAWM1shBGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714600; c=relaxed/simple;
	bh=pifsycc66KzqpKaUgTJMqgSi5C71iSmELI/zL5LoQMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lBECN/BJBd/c1Kqg8cS72Pe5kLNcZmpLzRxN4J7peIvNhZjoz0WaXfa9CQWWO9Y45BoTMTXOXYP/Q6mFufAEE6TcW7Rxo9ulssSlhQv147V+FVLDpJwqsPIAcbPtYV3tVsMkAN33oLD647TOfv0btTqtPRi15XG9/HpvjvNNo8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djN4lqYb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djN4lqYb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548D2dkb016320
	for <phone-devel@vger.kernel.org>; Thu, 8 May 2025 14:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i/cgkTnxyg5jfdY6+Lyq4L5THEEwjAJtINqyd81Steg=; b=djN4lqYb4H0wJPQb
	K4O5bAJWtsSJsQCa4f6s4FobiXgYyW5Hg+NLhQwSa1OaNpB9wJemiy+SiP+tUhpY
	WKQp2BkM8Xv1WuUZwd/e11HMvOdT9VFL1AorrRfl7W9TxDDxvM8T2TobbhGEv+qk
	dA7fIi5jp1xOo+v3eNpYndMyrRNA5285CnsYMJfKIKQCXQ+eGpkH9PnH/wCiSX62
	iUvhPOPRwZDtvgEuUBqXLOvOTVrgS+6sLvi1ajrdsvnIAsjEF+iJbUfM4noUE3wP
	DF/VY/7/VTlVFaX6NAVT33pyl37kG+c2uCStfuY7E7FSQIV0kpzWH5guSmeUY4mT
	gUHmlw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp8sk3d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 08 May 2025 14:29:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4766654b0c3so2952221cf.0
        for <phone-devel@vger.kernel.org>; Thu, 08 May 2025 07:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714597; x=1747319397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i/cgkTnxyg5jfdY6+Lyq4L5THEEwjAJtINqyd81Steg=;
        b=AF9P2gaeYKM8fyLiUyA6f+1eUWtwA4n/BnMZn5R9LcaGq6cPfyZzeXuoWiDqYkzCdS
         WsRtkxJD5jvI/lk4d+RoqVVM/3+OZYHMCRTH6tDSmsUMP1Exl1eVeyFMjLrl3OSYIbhf
         xHYopB/P0L6QryUWtx5N2wgqtrkbbfPoInPql4NtM7BomNes7u6kfSotowYuIJ+FsxnK
         7AODkFzTsiF+Duyv1M+6TPToMAwThqLTi4NcbhdoPVXuL8PaMj54PM6klay9Hj+RduuT
         IzvITiUc6h/zLe6NuEQLsGyit055w+1u+pTuOb+cnjatIW8xxetgmDWzeqvNEZhfBmts
         eTlw==
X-Forwarded-Encrypted: i=1; AJvYcCVBZr10o+XNuAP5ws5ItvuJNJ1xSTfV3BnqatowFjsAdJfJ4oRzO1eXNE9NMRSgBEtaXA63nDvByZHTTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDhOuNvvXNFJTMRdlfDEb7ZDbUz7+Mckpa+fn5YGURur0qZxG+
	Z3457XWE6OtrDOn+nnegObRmtnDn9JE+36QrMlqS4UwA3J1K2UASEpfK2w/i1qHYemO04/y8p0L
	hgkMe38s4/ZUZzC6ezGnjqf+u8b4XDnZ+hwj74zGQHUxTqD12VxAboW71omXuaQ==
X-Gm-Gg: ASbGncuZi4IhbWk26m/tFNzbp57VkwL7p2QOr3REXaphzRFmjCTbFAzH6aQ2B6d6OAo
	u83suxTCemti2KbrjzqxDXjVBL/BJZMjUt0grtIOyCuLDLuNP+1QeDgDvxBQsvvKGGSwOMieszC
	YhsVw0YMw9j/DZH19U4gBj5nyyCPaHI3hwwubzfGmqF4B//Jbz3n7YgveaSMtGIcxQYYRRvjw58
	E/a1vY4HKtL4kI2aU/1beBZ+ZC7xr+041puTma+1CLXmgXh8F5Ag8vLsvg4tA/POg+7LLts1nLy
	S3xTgod4AW5vKiEp9luENREIomPxpKVjVXU6rjUp1gliflthS7VdiJFnHNMr6Pm7lQs=
X-Received: by 2002:a05:620a:390a:b0:7c3:c406:ec10 with SMTP id af79cd13be357-7caf741a8f3mr434990885a.14.1746714596758;
        Thu, 08 May 2025 07:29:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfaVl8OObnjHQhd/SJGAsLqOH3DFL4CG4ytZ/Pzo30OjRSwoRvlTataNc/c/g5GA7RSzbphQ==
X-Received: by 2002:a05:620a:390a:b0:7c3:c406:ec10 with SMTP id af79cd13be357-7caf741a8f3mr434989785a.14.1746714596360;
        Thu, 08 May 2025 07:29:56 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa7781cffdsm11366152a12.46.2025.05.08.07.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:29:55 -0700 (PDT)
Message-ID: <7123afc3-ab67-43f7-b346-bdc336481992@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:29:53 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8226-motorola-falcon: add clocks,
 power-domain to simpleFB
To: Stanislav Jakubek <stano.jakubek@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1746711762.git.stano.jakubek@gmail.com>
 <cdb6915bf40c055c77a0beb2f49c20458adf7481.1746711762.git.stano.jakubek@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cdb6915bf40c055c77a0beb2f49c20458adf7481.1746711762.git.stano.jakubek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tPExO265Urv7g4GC0R7fVBu8XZLlJew3
X-Proofpoint-ORIG-GUID: tPExO265Urv7g4GC0R7fVBu8XZLlJew3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyMyBTYWx0ZWRfX5DY3Uzh8y35O
 aPjCZEczy/GiHS+yyMJbpDgs6zWn0ZCjo7egVJ4iyoFL6YpROFw4ftKr3umUe6QAcM4ym318dHU
 dXRHFKK16XyU0l4wXRDwVkJv7WRo+w24nj9XvzRd10f6Pe2WfDmI8U4s5qADgIWPQxq8LeMDFpA
 JUfULmv3PXSfZnwqeDXL64xXTpySMAXxohJrmIqvv28get33/WvkAGRcsJbpMSP34p/jTUZXU+C
 BpO2+BPahlcWR7Lg08YVyXPLhvBF1mB8vc5A0rHQjJ+kCJ0X0mVHnhJhIe3comIL1eGlC/wQLXE
 +tMaKG/KbdJYGU4ey3a0lXHtxIOWJP7kLPWIwjPNQ7xVn9pNjt2Hz9yXf+iq+LGNz/LzfBOQhUi
 Y8p6vWSJS9PC0sodCarz1oISh60EJ0t+7Oig3XZIj9w4TtDgO+n0YxcgZAc0B1WRsXSTbDMV
X-Authority-Analysis: v=2.4 cv=e/4GSbp/ c=1 sm=1 tr=0 ts=681cbfe5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=uq1pj42CD5qt1GRQKNoA:9 a=QEXdDO2ut3YA:10 a=8aNmnrDM0H8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=710 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080123

On 5/8/25 4:11 PM, Stanislav Jakubek wrote:
> Makes the display work without clk_ignore_unused and pd_ignore_unused.
> 
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
