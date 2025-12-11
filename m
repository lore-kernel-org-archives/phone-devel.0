Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F2438DEC
	for <phone-devel@vger.kernel.org>; Thu, 11 Dec 2025 05:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765431079; cv=none; b=n8zmx5us9yNo0S3WEZgGHcRF5c4O0soSFkIXLApDkX//TbYqwbcpU4nimlicv387Pwr6GzcOM5J8oTuZ6X8JZyU2zhbKDR5lWrw91Sbbikddz44SiZxDDSrustWr+lYRch+dTOP9zzqzOr5UsVUOUVMv1tmAINATR/IP0qqNlds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765431079; c=relaxed/simple;
	bh=HfRbMIsYqDEISoqUdpkrzjmpPkk7sGGNN4E4Vz/I5no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hDoc6qkYh9QN1aFQb7iw1OMMxLqmWaawjT4ocMJJ7ny5CzwxvL98s/HroqgiBvNI3YadZY/COqxd48pQJr6/0HybU68Z55+pPx11bVCUY07kVCGxzylv1Ma06pkbG0n/5VofW5Ff74mb0kNKzBfggKC9fIkebLOpFKYuOrbYQWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iyXqBZtJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jx9CAcdw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iyXqBZtJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jx9CAcdw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALPJ6M3545019
	for <phone-devel@vger.kernel.org>; Thu, 11 Dec 2025 05:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=21dUakS0W6yQcyfVKAjQGITz
	TtwkdZ1MX0yeuMPTQVU=; b=iyXqBZtJdMp9dPCSDDm94OskWlBMLTHsuZwmyPZm
	h7/mmhzQq0fqCbT51XZsrLKwAtgk7OYyssTN7W9Kmpevr1SPIQKDQ9oltlkfO9BO
	dLzisN5lijEofXys2gD9Zss1thaXHYwtNqOJcV3p6d3iV/ND6Eybq9ydP0kXlPnX
	PS/ou9AVFxORQiL8rLOkfOfpw6ta2TdwMjrnIJIxmyECfF578pLd14C10IbX+whQ
	h2zgU5/Sl9hMAVqzjijLWq6TipPuEVxNu+dGzcLkL8c3xAkowt17kgADI6ZKADCC
	WvJzDNw4ytrsAUk86j/eFvZp3b2n7riq0hVDaSVbdXSJkg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay1xp48w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 11 Dec 2025 05:31:17 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-55ad466ae47so1039320e0c.3
        for <phone-devel@vger.kernel.org>; Wed, 10 Dec 2025 21:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765431076; x=1766035876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=21dUakS0W6yQcyfVKAjQGITzTtwkdZ1MX0yeuMPTQVU=;
        b=jx9CAcdwTe60AtAwoiBySy16P6mUIF83mnz+U25IGKrOZH7xchGL4y/KxVe/8sDnVY
         +/uhPC3V9Q01EwOt/Eg9ZL4wWX4joWvu/tc/w18fHp59rrDKgfsmE/kqiwAfFra0PWmE
         J2XpFsFWGM25qXZMD2vMgLLxMlYyOgFNSzsxNj2CBPLrP2uOjhApFfD2ZksTTdN3Xwrg
         81IX1Blh1KJRKqXsa3C+VE6/Qq72solj9oE0qS4vodVG22bW6uKAT9fSoDCcZRD57w5L
         tvH5ep1Cz/202bUHu1rT5KoARWIiIRnk+C7wa4OHuhVy28DM/8uLWS+qZgKP6LorVkad
         mw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765431076; x=1766035876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21dUakS0W6yQcyfVKAjQGITzTtwkdZ1MX0yeuMPTQVU=;
        b=D40pSOCI/WVidU20Ul5yrRfBMl9RbEwtz0K+LgHhMDeexgLfEEvLbO7jEzvZb/7b5q
         toKp1O4wRxChoAEAKYRC6GIbOen3c6vjp3Q3+Sos3cDpDUJ+Q28fI+97lEi8vFmlTHfz
         as3McNongRbRSumZE56V3ER97f23pYH0EvuyhNBbDOzNWJrOtfGKR3LeOK2qHbeConIf
         B5m+sE61/pgFXawbaj3t7o71WFrF0fnXK9YMSUb72p345dvma6QNv0Me7JCwczgANuA1
         fhL5dg0M0EMIg137wFZ1+MnRYlKn2zEmYUUq0xrllfFBDMm3Avh6u0m1WqLPemQzdrRj
         sF5g==
X-Forwarded-Encrypted: i=1; AJvYcCWwTLMMXUzMy1g9Awjc/ZGIpZjbDbw5ak9VrPzhvNdPHF3tWmrbTJNBiWfCgFIH9mQSr7a5Qqm1iAXqSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNduQxoFFIgoKZ/BLNYKCoiKCvmvhKl8Cj1lVejhVUulLqtyyV
	DjVty2dUzhKIn5G72+4K1joNj2/qrVQcGRH1JSunNUoKv6ndJDc+jIwnKDEIxKChSBWZC8xuHyb
	bLxBP2zObUjwPETtApKu701uW3wt2JxCUUw9QnDWNA9/dwECUfPnpJXgTrlw7uSbevA==
X-Gm-Gg: AY/fxX5A8IpO1Tus+tE55MHpBEqevwec239THDB7pBzLYcIgj5bn12+sK5Pb1QqAmgg
	qst6SPx1eu+jQ5MWmbtMB2qbTpL15gt2MNnbeNnYc1Z2tabeu5O0OZK54XkUO0bbBdvvDaej3Yd
	t47UKQ7ebReqq5s0ybYD5+ASgEWcLXHQR5o/qmz1kbqMF2I5KzgPmgQAypsHEhYIDXNJGxHhCCI
	vieWu05A2TZxn/90eBl2FlmJKbX2eOawnK9sdAjim6eArUJrNf0c+YiXf2RhhzX/jEZTSDnI+Iu
	aVF0N9nvG4cLRNxbFPwDJVgDBLeFLJszQxFy2p20Lg6+sWOSgVACnplVVLBlzqPs9V5pMrtSJj4
	AZb9f83AxI3kr7cfpsBKGzBDP4MbdjqxtUOhtSHjMtXR7PW871Ljtb1xNG/R092VsgR7110irRh
	39v4QnqmiL2EwqfSJLkM3Qgww=
X-Received: by 2002:a05:6122:3d43:b0:55a:be72:7588 with SMTP id 71dfb90a1353d-55fcfc17ecdmr1640896e0c.11.1765431076282;
        Wed, 10 Dec 2025 21:31:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHE/I4quVlGCuXeapXbriQ0cNjEbr8rlQA1sDsuFPSTVHKkYQ8zCBBqGBTynAEBMuKHY4IjpA==
X-Received: by 2002:a05:6122:3d43:b0:55a:be72:7588 with SMTP id 71dfb90a1353d-55fcfc17ecdmr1640882e0c.11.1765431075872;
        Wed, 10 Dec 2025 21:31:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fbc9d0ed5sm4213411fa.20.2025.12.10.21.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 21:31:15 -0800 (PST)
Date: Thu, 11 Dec 2025 07:31:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/5] arm64: defconfig: enable clocks, interconnect and
 pinctrl for Qualcomm Kaanapali
Message-ID: <jiq5movgpra4kfqvjccwaxpvwelxxx7edrg5atn37u5tfddxfd@az5ommuhf22z>
References: <20251210-knp-dts-v3-0-8dcd52f055c2@oss.qualcomm.com>
 <20251210-knp-dts-v3-2-8dcd52f055c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210-knp-dts-v3-2-8dcd52f055c2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAzNyBTYWx0ZWRfX4b2PaafN9BIA
 BT6nLHiCbYV4P6IfhE1snLyhXqqY5g+fpBwYX1NrUcJuD4pR7LDdCNKMPMQS8Jp49GWKb2ayiin
 tCxKb/gWQeBtJkp9f2v42tgyjYagG5/dq/OnZvSo/kL78928zRpjWqCXpwd3WIfxkA0VTTSTmmx
 3MFUHLquciHRORDeN7zuaF9VZo0dZ3g4kYnn63xatq6eb6M2QOoEMctVC0IYETt/vThDyKk1FHI
 GPa80LjOqI54zGAv9MYKQZSr6JZz2qRn25oRyMIim5N/cjfWSaHFalcYEv1cOEv7Hc9ex1rPUF9
 8mbGIslijdp6Vom8CYd4qlrntW5wynwBK2bgoDpB6hc5k/TeeByDREaq0Q52FRgKEpY+tzjqtdl
 ec0fBYMFlswtZ5k+xiSeV1qCmWNJBw==
X-Proofpoint-ORIG-GUID: UgCq_owiShp3qokifFgnpkCo65OZSEY0
X-Proofpoint-GUID: UgCq_owiShp3qokifFgnpkCo65OZSEY0
X-Authority-Analysis: v=2.4 cv=A/Zh/qWG c=1 sm=1 tr=0 ts=693a5725 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=5dBC6bot4-jekUxq3rMA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110037

On Wed, Dec 10, 2025 at 07:05:03PM -0800, Jingyi Wang wrote:
> Enable necessary drivers for booting Qualcomm Kaanapali QRD and MTP
> boards. The serial engine must be properly setup before kernel reach
> "init", so UART driver and its dependencies needs to be built in, enable
> its dependency GCC, interconnect and pinctrl as built-in meanwhile enable
> TCSRCC as module.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
