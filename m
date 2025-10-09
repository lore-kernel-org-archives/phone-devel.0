Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047AB2EA46F
	for <phone-devel@vger.kernel.org>; Thu,  9 Oct 2025 14:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020867; cv=none; b=TXDjzjyM3CLSr3pUaB+LsqjzDsHrRbmY9FxtHzaPIEAVO4FxovztHEKiQQn/iHyeCuvtyfSoxFprNT8FK1TtJBtO7P20zDy1UzpNzbFJYasAdVmPUVrgd+IuzpTdc9jb970nl1qTT8A19XmO7jAKSNuFq0EpSH02rDdO1IHiRBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020867; c=relaxed/simple;
	bh=gJD4F/VUtyf9cPnOh0/z6nqdkyZqGE2442d7pVCtk5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+YsRqa05Fd9p6naRLvezyV83nKLRcqbAiwPmFTzUnSvRrlXYug0WQz08Qi6MC+EdrOp4DgMBk6ONZsY9JPnJ7kzklRjs4BnpjNvNCE4B4ZMS5tSnx0YnA8Qf4er2pUlNsLwFpKnE8x+ast3EDaGHNuBS/Ie+fLE81YMX6pMjVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YkoKfHHz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YkoKfHHz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5998V0S0031641
	for <phone-devel@vger.kernel.org>; Thu, 9 Oct 2025 14:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cE4ZbHCvUDpmT8UVULSVyNyY
	hgMn1RLMHyhsCsq4I2o=; b=YkoKfHHzQPmes5X5Lu7uBUVqJ539HybUmEdJTtNs
	mYRfymI5GNrRBZovHKlnalSNkYlMHKSjqwnoTeJO/1qKHtL27T5x9HHrJZmgiI5e
	M22xHnZS7z3NNq4D8F2wzNqTi5Z5QK0k4ggwg+4tC+j5+2wUtU2OthJvqKUjbNXa
	pFzTLQSFqTahf0gRoxPQgpHQalzx5K5clJ26++Arwh1Lo4yaS/t5/7FBdDE0BWFU
	atFEI2TtmTaL5plnap4dtdza/xhMR1m5MvItzmyoVeOy5pQiEGfvDob11DS4/8oq
	VB89Mc4Th3E2JqlfR96ntjKNXtiE+9qX3UyVwEBipgB0Jg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49p9m0s5gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 14:41:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e574e01ed8so33467491cf.0
        for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 07:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760020863; x=1760625663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cE4ZbHCvUDpmT8UVULSVyNyYhgMn1RLMHyhsCsq4I2o=;
        b=E+E0pcyYO3Tkz4oq4/ulaBf0UFEjc/CalJ0cZUFt77/20uGr0vayE3E7YKA07looAa
         JMdh1vXhfee4C2kK1FhYfUaC9QcNdOz3NSEM3U9Hu+M2mVPHO1XYE7aTGLQIuPvzahp/
         JZcskDGjb72SHBHrqa0pTcxUj3R/v/5db98XhBtjVT/LkvTbut16aqDiBtGc/xSHC9TX
         nZvrjmdS16IbfccrfglioRGe1nCckV4wcQVItqP+nD+vQfsvT3z/t8YzppxA9y7ZUuHt
         qr8Av+vkb6+pi6+nj6TcmjhpMufERwkpoPXMnFX+tgvjVosHkecZEc8PvRNSYTH5GjHu
         T6Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXMzu1rJ2qO/J9MreDVqhQVXSOXSNKypeo/XJPJUg/6kFp3h+upmrSrlDxLcU2xQYfAGjL1Nu3G0cgDIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyG1TeCVMPy0MlwqRBllsIZTcE5sfX+88VmSI1oyHe/GyEr4mql
	gnMOQZmBeQ4KIm+jcYpNjmhmONXZaTa2euDmjN2uhg3tdmQY/VfHlVY9Eocta99t+6XXKEgFphP
	h/kKmKf+feNgESjofcKETKjahgHCZWg1MTotKtEAAaIaZ2jchfxvZEbV88AyHSsdezQ==
X-Gm-Gg: ASbGncvYna7Qbk3OtxCaKtcbUYwa4K6C3gQvhpBVn9YkiP5DaPqnl44vTiF9peakHGb
	oZLXS87N4xkOKUkuLNwc6Ippk0NlWJjFcims0fiKv0+1cU4qEe2e7bBay0p9OytVdUJKtXFPA+0
	P888Lv2JZ6ostC+YUg1oEFRzuFdzvs8Xsv3PVF/4MRnaGPHpNMP1cfjNMhE6X7jcMME0waCzZf6
	q/AkfL4tZo4eNT3JdiKvTg0MRk49scI4i/QnR6Qw+q7azHHyA/9Ur+aS57HdAuL4rlHXjw1+/FO
	cbZl/mlWxBna58/eiBmLK6KrWPXGFOgycrZAQl8HXAHkFrX205luHy6uX5l9NpilbSSNrVerTuq
	PlKU0BG+pKlq/Bpw2RhK905Iw2zzCGkhjE/ManeBlcT1v8+im5J0HPy6tIg==
X-Received: by 2002:a05:622a:4d0f:b0:4df:45b1:1547 with SMTP id d75a77b69052e-4e6ead64873mr98220211cf.69.1760020862921;
        Thu, 09 Oct 2025 07:41:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEm/vMZ4n1+Cr8Xoyx5rH/NZmEs2uEEJqGMiK56k8l9LCNH4tFsaMchJrEpi+ttYXYEnglWzQ==
X-Received: by 2002:a05:622a:4d0f:b0:4df:45b1:1547 with SMTP id d75a77b69052e-4e6ead64873mr98219731cf.69.1760020862443;
        Thu, 09 Oct 2025 07:41:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907adb2607sm1093116e87.97.2025.10.09.07.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:41:01 -0700 (PDT)
Date: Thu, 9 Oct 2025 17:40:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: qcm6490-shift-otter: Fix
 sorting and indentation
Message-ID: <4zflplcqdjbkplu2pb3oy7pc24svrlo6id5kxr6g4ivvyrxh23@j3bfneurfaza>
References: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
 <20251009-otter-further-bringup-v2-1-5bb2f4a02cea@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009-otter-further-bringup-v2-1-5bb2f4a02cea@fairphone.com>
X-Authority-Analysis: v=2.4 cv=a/U9NESF c=1 sm=1 tr=0 ts=68e7c97f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=7Ovdx5uLAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8
 a=0jPwT5uaXyJb8NjaZ-0A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TQZWkJv5rNK5-PaLMsrg:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 2HyIDwZNn_aomwD6Pj-sSBc4yWLQPi-U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDA0NyBTYWx0ZWRfX2oBbuyztbeh/
 raXSZKK3xzKgv2dCm6l83oiGMxLcpqgWiuxQ54FXF3TfoDPMTjIOGGA1BVDCXZFnA9oY62lOvsW
 cSv4g1HtCAhGmnd9U37iYk7hp20kZNkDqeGnsRbLSohrcg9ejFzncMqLiGppvp8uXM7Z6EoUhcR
 FCD4bYSB9QeOrfAI3EB1rFra5X1lZRV7ShVjdDptKf2v4/uWvnSWFTsxgar86MumZlZ84/W8YwX
 crnNH4fgmh6qVhcKZP0OjlgPNIm6e3ed6DEABahOrR7Q3RofBfcDmob3u185O4hdVdQ+upCrRAu
 3NyohjWkWxgbPrVBqKZlTFA38OVWeAJKbnYIrh8zLCzGkrGbAck5eSb5JmyYfcrhaiAgZmBGJ2x
 tq7GZZLpJDl5xFTu1u7LLVe657wq0A==
X-Proofpoint-ORIG-GUID: 2HyIDwZNn_aomwD6Pj-sSBc4yWLQPi-U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510090047

On Thu, Oct 09, 2025 at 11:06:31AM +0200, Luca Weiss wrote:
> From: Alexander Martinz <amartinz@shiftphones.com>
> 
> Make sure the nodes are sorted correctly, and the indentation is
> correct.
> 
> Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
