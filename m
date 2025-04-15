Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44C5296D0A
	for <phone-devel@vger.kernel.org>; Tue, 15 Apr 2025 13:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744722408; cv=none; b=s8hO4eb12YIUbnTnPB9F/5nzerHuOFEo1DLe9v76nCROFPKUa3Z/g0E9b+ROz5lBuelOqp1OJeuYzrw4XmhSLsA6bEQVxz53oJbHAVpbwjR7jssnxBpnvjCf9Kf+9kYDyB/oAcE+5VN9UkbbirOjkEpYY7E2JHQSrDqAUbwgULo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744722408; c=relaxed/simple;
	bh=LRjzUk98Ay4rkH2g63a8V1YSrPWUfgx7kW6KTmPcAEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xh3W5+G1ldNUUO+f7d1R/7oCMRQDe1TVQ6h5Po+8U3ypfxza9kELbdb6o8R9MEPF9RYHSRueEIMiI9V9JKYMpd/OAHBQ2ulKDIujNRE92DKjlZwVpIv/p5xG2ITZQe1u7wM1LDLLfKEf2cDvW6GL8ddiXJdd9aQ9QOcF6ZxdG1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J2nHIshQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J2nHIshQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tHjl005255
	for <phone-devel@vger.kernel.org>; Tue, 15 Apr 2025 13:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I2yqSqYT+BQkq6vUzZFGc3Cc
	/VnsQ5Jf54JehSpetyQ=; b=J2nHIshQR8meGGBMCwYgRHBSmviXNlhHcweEExP+
	7kE2ACr3VXl2bCUVD1I/D33Dmk2dR2UXHMd3C4bcwOhgsEVO5m6WCHQiAEu7/gbo
	Q+2XE32kgB2Y67nI3HwoIw7AlgfqdQLBCgKzT6GsXnrjR+nAb8oAVUCJ5Z/RsrMk
	LW63lnLIOk76b9XrnKQ3MO3t+VgtKLRy8nLundyhThVbNw/M8JlXzkmtJt14olvo
	1u0OV3JoZYGXdKFi/LL6fx4hG7W1xxrKwXsz58JtBhiC37vfx4jKw7e4bIqwLkHS
	MOx3nyQxXOMIZmwg/syCVtxAVaAS9dWFnElLaN9sNAJUCA==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpqy21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 15 Apr 2025 13:06:45 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d5d6c997d2so52455985ab.0
        for <phone-devel@vger.kernel.org>; Tue, 15 Apr 2025 06:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744722405; x=1745327205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2yqSqYT+BQkq6vUzZFGc3Cc/VnsQ5Jf54JehSpetyQ=;
        b=gzmyruSuWdUm103Q+NG2pjfS5Q8ZSkpTnlSitdF7+VdMkI0XigAmVUe9SmVBinL2jh
         z0zFtOkfO3JdV0PlAepSqsiA6zSa9y15ZYZDudc2HK6hydNDY89V8IaT2g1tU+82jjLp
         4dtTtSOYcxSnbX2hINcsyP7ZaQHJo6Y2PCnD32TX3sBJLhsy841J3qyGfM/pVgXpObq0
         n9Hb47iGQ6CZN0F2BCQReIewlrnyU6dJNyq5K+pevQDkla5ju+DlABeB+Xvhhqna0YRP
         5ujjmI7thOQOepC1wkSMswUzbdFIOFPPDTHrJ79lYRzCEgxUlGhVXbyaGiLnHGTX9CPs
         wf+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXf1B5miATUFWPuA7SYfpMsQ+mLJOnkju6TPGuIo2zHRwM5+dYAXM225UEImkWkxtzIL1W7lROEP1+D7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyC37WFst4w5hkm+X8Wd5LlS66JdYLknMuf0AqoCHK5e6Peva3X
	3H/Cjro52owA5dswWupDPaTpHdL2YMj5CHSRjn2EImyj4h6I8D5WKB3q79VbCLhV+0zx3FTkc5a
	De4bWRjD+foMFLTad85LHr5IPyqDYSngaKsZ76mV8qEIlPFTmmA5Hhq0DZdh2ng==
X-Gm-Gg: ASbGnctqHRdyuE+/ROQ/WZQ0kYl5lPPqdwzsm+Dpt6umzvI1knn1Sj5rXSIJuLfNd87
	oCoRRjnbTlaK1k9vXGD1XsRFik3d8HyotVgDVXj1Q36K4/dMOf5ZJo1Hbr+DqgKdlb+Pwjaz77+
	wfXC512+UOeScXJUGyG+qjVnbtFXQaRXjbvdkPjXiN7Zrn7ZOlFiq6QenIx3xKwoFG+c/iMHQSo
	xJqIklWoZ3r8FI2lBQtGxh2GUYV3aFo4zgFX92gwgNJsKluQ/R6xMF7DJ6ndaUKKefHjPKoU+a/
	vk+zVpoFLmRlHGpd5t1HZInnfJPRdhkLa4olpNKvr8ohJT1lixLb0KFKmuYGUbXasNuV3t0F/7w
	=
X-Received: by 2002:a05:6e02:3190:b0:3d4:3d63:e070 with SMTP id e9e14a558f8ab-3d7ec276433mr153252015ab.16.1744722404759;
        Tue, 15 Apr 2025 06:06:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyOdYuqVfRNyq0ocgQys9O5xZSGLeV0wJ4vgaj/T3BvgjrDcLaVrzlSZ7ZrvkI157Mweo9SQ==
X-Received: by 2002:a05:6e02:3190:b0:3d4:3d63:e070 with SMTP id e9e14a558f8ab-3d7ec276433mr153251615ab.16.1744722404449;
        Tue, 15 Apr 2025 06:06:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d12342esm1412252e87.50.2025.04.15.06.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:06:43 -0700 (PDT)
Date: Tue, 15 Apr 2025 16:06:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Caleb Connolly <caleb@connolly.tech>, Dang Huynh <danct12@riseup.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm660-xiaomi-lavender: Add missing SD
 card detect GPIO
Message-ID: <p5hl53fvmjdcufgigobobkqkjgm3xxigsxbot74qijejx7ftuy@cnpncgr2krnz>
References: <20250415130101.1429281-1-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415130101.1429281-1-alexeymin@postmarketos.org>
X-Proofpoint-ORIG-GUID: C_6psiKIfvYpDvUHtL-LVXIuc0_2j9nX
X-Proofpoint-GUID: C_6psiKIfvYpDvUHtL-LVXIuc0_2j9nX
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fe59e5 cx=c_pps a=knIvlqb+BQeIC/0qDTJ88A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=TpWtbmxy4yRKwG7gqU8A:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=8vIIu0IPYQVSORyX1RVL:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=688 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150093

On Tue, Apr 15, 2025 at 04:01:01PM +0300, Alexey Minnekhanov wrote:
> During initial porting these cd-gpios were missed. Having card detect is
> beneficial because driver does not need to do polling every second and it
> can just use IRQ. SD card detection in U-Boot is also fixed by this.
> 
> Fixes: cf85e9aee210 ("arm64: dts: qcom: sdm660-xiaomi-lavender: Add eMMC and SD")
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>

Please drop empty line between tags. With that fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> ---
>  arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts | 2 ++
>  1 file changed, 2 insertions(+)

-- 
With best wishes
Dmitry
