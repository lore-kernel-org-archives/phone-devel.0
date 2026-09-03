Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1EB3F23DB
	for <phone-devel@vger.kernel.org>; Thu,  3 Sep 2026 06:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417495; cv=none; b=sEiakIan7RpgYcFQUqyxSmPvc5wiw9Xy/oM0TwIIJLFhe7Ebe53duPZUFkEDOcHuxhw7URS2gIFCNUhI3I+pTqWiB3K1s+KIvSRgzet7uELnzkudlWVuLuyQ/RKrtcqEjh9sN+P4WKrtxQmNSHGOj2yMvr7BHUrv9k4j7uMIkbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417495; c=relaxed/simple;
	bh=kTSx32pwz72ST6W1u3JCf9MAJhvDpt92EnV9VM+cQfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IhcqFrc+KrDB8BwuQ7CBOa2rEK2XzEn9cJT2MuR4fp3RBh1mucpqNd2X+Z6L3eUlo0+1LJ02F9b9wgU9q9AQtRFmHvNaybQrGIjBM+7D3r+oTPZN0BScn/3ZdQar9eJcejdfzAecjo8Mkdf5Fq/Hq3MDL1LrbwhafgpNymt96xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3ZpkMxw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P3h/M6MU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f3ZpkMxw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P3h/M6MU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lwPE3642681
	for <phone-devel@vger.kernel.org>; Thu, 3 Sep 2026 06:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kPYnMIwUt1sAQ3vnoWcYPF0LEE0sls/qUz0yveE4jHY=; b=f3ZpkMxwK/+SFxYp
	1VSGD+lmxJUXup4wwz+QJ5EvxIHdseXWCXvCW8HI4C3+y2M+kOuN9OKa/3aRutCC
	T2BLKHtfW5/vXMexS6plX4GR9EtB2Odp91nytHy3+ZqwOghXrHd4MuID4b+YYyrh
	7DjkItl1GBFHEx88OWJ0nG0scpZ+CdF00vd3/xGN+h3XmWhxXFikFqqasnjmJWwo
	Fqc4vW5IxEsXyRflF4fFDFhOuuQ2q4NaNr0cU710IuGM2Zyedkm+tuef0Xm/+XqK
	1IgVs4Lq75IPKHimS2mAR/f91thuR6SmZsIaHrko5neIHtT3hNVOPg3I0P1v9tqc
	Mkc7Nw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdugn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 03 Sep 2026 06:38:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9392788b3f8so49448585a.2
        for <phone-devel@vger.kernel.org>; Wed, 02 Sep 2026 23:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788417489; x=1789022289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPYnMIwUt1sAQ3vnoWcYPF0LEE0sls/qUz0yveE4jHY=;
        b=P3h/M6MUC2Hl9btE5c7ksr8t6zBG6FubU5SAfHD+ehguKSExDEZ/Q2SkSxn5kvnnZC
         apVm2kREMsIK7tCn3mGpAj5tMNdXfrcYsVHivpEFvmvXp/stI6wyJHRo6M0vje+xMiwG
         2RB4KCtTKtZIIPPMMLUOivnSmvKZDyH6ghYfhe9c31Am+vhLZZStLZua+RIUhw/4BAP+
         sGNpH4mi2QeSIf6+2s1oLWhVjMVYelFjlmeIqu9gBB9H3PCuZmbhXmcG2CzBbCU5Z4Ar
         /F3V6E5PecrAtOcs4H/4RLsXMq5ahX7auTc5LwKuWQo8HtBNR9LbYiLsLuKFGrz6AWn+
         F0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417489; x=1789022289;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kPYnMIwUt1sAQ3vnoWcYPF0LEE0sls/qUz0yveE4jHY=;
        b=AwlGOPwcu2xFFcetpO+09livW/q1fO0Hi8G4+zhhFwABhSyXYO4J5xPrr4CP4V/xLF
         XpYcyd54QO5jjKVtQ/InTIpiTnSW1coxzd6kuHH4GWQiS5TlUHYqOSvLUeWMXXeA2EGJ
         NbnjU0ctp2lrcCgqnJ3U+8Vpp3m2bUqhR19VOYNaEUFUcrFNAmMiFEz7ZqfWSnWRz0Bd
         XfbVvxzvKnk/m9KnxjB9FL19rDyvgHxA8lXiwO1eC+UpbQshsosFwuTy2gklG3yH4GOg
         C9A6Sj8ngHs+3QRP4vdXcH+0nJN5TX0i0tAoEXShFQEjM+PLkXEL4GbugQZeN4HM1Liz
         PMVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmrTaAfasmU+a3HpUXHiLfbbg4/ol4mJDTO9XdphjfC0KD6naXci0HsxUU8CmIcJEGEvmVELOq+JzCvw==@vger.kernel.org
X-Gm-Message-State: AFuF++lEivwQLB/zkUwN1Rz8SqwYm9xFhNXdWcNkR9qcDoEvo2QYl5FY
	C+rPnWwdjwkzvY/K7IAYaADrH9gZpToYBck3fEDbIn5iHwrdf2tWbIgaLVdklii2+eqD9qqyq/o
	hlJ07yW8ZTKJMMg4SS4RIcCUp1tCNE68jWxgzC9TMJhbzVQxBl4kvoEObfaQsqPASOw==
X-Gm-Gg: AYBFou0golfia2rRYCkB419fiXBN5UAjb6EBJ59K9II6dS7RvtHCNl7hf/oBZOy0GTS
	arFiX6M41Atp/NKZYJLvyjsAtgUOAGQw3VZiiIplHUezH0jTFaqRPB0uhX07Q86Z7v1siKo2q71
	EPJXvuaXkSmts3Qj2Q6LN9GPkHCnW0YB/PvPFtMqkSlrBh8mDkqPHhxSTSPp9nyZIUmf3q1wcg1
	phB4++bNBSXt54O6xy+uvqvcPeUdPeapHdKCxund7O8KiamcLkGYsHUi09MIaqQ+1fUkFzWU96x
	i9D+Y4HhV70DxqC/Nf+BhA+3/BCrXRLxN14wpZsMI0fF13bzM8ULVHmq9aNM/HRAgFxA1WnKXW3
	0oGMfjZTLEldSF3488of9pA==
X-Received: by 2002:a05:620a:8388:b0:939:2880:3d6e with SMTP id af79cd13be357-939610433dcmr718370385a.5.1788417489370;
        Wed, 02 Sep 2026 23:38:09 -0700 (PDT)
X-Received: by 2002:a05:620a:8388:b0:939:2880:3d6e with SMTP id af79cd13be357-939610433dcmr718366685a.5.1788417488768;
        Wed, 02 Sep 2026 23:38:08 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4236f8fsm50762866b.53.2026.09.02.23.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 23:38:08 -0700 (PDT)
Message-ID: <9c72e597-eef1-42c8-bb08-a9d3c08ad4f4@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 08:38:05 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm845-google: Improve NFC pins
 description
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Acayan <mailingradian@gmail.com>
Cc: Marco Mattiolo <marco.mattiolo@hotmail.it>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260902-sdm670-sargo-nfc-v1-0-bed1cbbffc46@ixit.cz>
 <20260902-sdm670-sargo-nfc-v1-2-bed1cbbffc46@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260902-sdm670-sargo-nfc-v1-2-bed1cbbffc46@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a9915d1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IwCXldT5zbx61SKktksA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: TJ1MxfzKDFB8uGOTmYXiXXXt7rYCD15N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfX7dAdSUJiybx9
 ULL7o5KgywRUw0UTYdt9NWLm39XpcICyiMh9n1Kdxm+8vRuqhJmabQ49pTKg5rioNQ2ZjxBZJBn
 7VJZv0lTcQ9ST7Cc8ctmDDUuRMl7CuQfKXEhfR+lzRcZQBi+2Qn4JO6GtBkfMMZ3hrWaijx11l+
 iPqwWlsegh7hvispP5A4oVhwMIrY71V5fvW3bXMYWcMDdA4PYcYAdaVBC9amh/5WCJsxAsXuVwV
 bK4PFd9TT0k5fr5Qvl7sKUHQeHigYvJStv7PDVSdHLxvOgyuufCI37SXzBcDTeLkxXc17ban73F
 +z+FPX1biJnLXF55SUywbFdWhCyWDBk5svC6FkZT4wntBVSlNzoLzuz+8s+SOQ8SYPAhpbPwTW6
 a9D7R13Uh08g0QjtAoKcaJB7NLCDcxU80uigvFCinU3q7yMAfxG8/sDxmhi8JwieBzgmxkiwpWV
 L6X6X0mwTH+ZT0dSp3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfXxKp91vBXW/LL
 CK5D5jfWy10gnZepImEuWkbN+/pFRahso3tGp73nSE24Ni7GM2FTHBLDAluQ79eRUMO1hITJFLr
 hYBfBsPqG/QT/0K7hx8f0eq6bnOPfnQ=
X-Proofpoint-ORIG-GUID: TJ1MxfzKDFB8uGOTmYXiXXXt7rYCD15N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030057

On 9/2/26 10:59 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Be more clear with pin description and group all of them into one state.
> 
> No functional changes.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
