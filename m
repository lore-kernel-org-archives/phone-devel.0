Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4626C45948
	for <phone-devel@vger.kernel.org>; Thu,  2 Oct 2025 03:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759375263; cv=none; b=kb0RhLvzQEi2fzTR0W0cReLZtnlMWDv45ZRroHnoZAh2+YaDglHgLZ07evFJJWeB2viAsX8Q0KPZTAfB/E8uuMDdhnkqHXNRSMFTuUkGQyBqcWeAfs3e5Hokf+zEYVhE6xfvhXT7VY4CXdF1sPN281CHUAehGpDGW1YcrQvm8Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759375263; c=relaxed/simple;
	bh=4OB98gy4e2/1rS/SKiKX1WzaFtLO7WAftK7JAWaM0DI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksSb8J91xfL7NJSw6JXxrEDP8Faxt/JqX/haS7F9tDSDzMguhwu1sHkhyOAQTUL0LurtUapiwzvB/U2jUGUT13JQT3L22MuxcdtFIHqr+MX17M+9eAMgn1UMO+Jk4CIepkjPFZltRe3HjXqrHsUFYYqXj6nkOQtuDzWEiqhWmJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QOyO6eeJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QOyO6eeJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591Ic52n005969
	for <phone-devel@vger.kernel.org>; Thu, 2 Oct 2025 03:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MadjmTlGyYj9vNqf7FS+yHZf
	TOeoUTWW+o+zA14y1nw=; b=QOyO6eeJhYeUSOYQXBuLGyU0HOrgAnoCNQByx4Jr
	aKyoa7j0shTN+8iOxcTC/Sof6bS/iEAF3sywu+fJoJhkURssGNfShWAxkV2mTBYt
	eO9uZ5iXdX9M0a3/32hjV5URbND8b38gpKjHAUXdrZg65kLNJzXS3owewbGnPMUy
	1NvQKwxSjeiarbT5EsnhCM4uQKBqjwx3vzQBxr2QaIjcCai02HgSZedJjvGsPGVx
	iwynO3huDsJvCJR7MYGo84JK3KX0cE9CSJTXYZriGBldfeqmg7IEhS+w+V7DBoa9
	NETXPyKnkWGfy7M6EeImtiD5ga8yDCvVG4y8RjDXx32qKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdpaa5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 02 Oct 2025 03:21:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-859e412f2c9so92696885a.3
        for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 20:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759375259; x=1759980059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MadjmTlGyYj9vNqf7FS+yHZfTOeoUTWW+o+zA14y1nw=;
        b=k2/I8w7hNMDISHkMcegP3RmVPbk5x2+hunNGXsNUjEOL05jM3nmxUkHf+nTrWgc5b0
         1ISJcdpf0qYu/sJl2dYIaQtY7sRNK6/RPtVRl8vPfFnXpfr3/uS5iolHDfLFpQGI5Ljc
         lLyC0X6g8bo1jUmdvrawcE9a64EqHjywb87M0j6siyukftyQI9FFqrkx3BX3A8TvYdNn
         cIF5wIKRYsVX3bz/Ca54ycUNAFOItmCNAY8Ka0Ppjz3VCmyCu4D8jB66Mvt/0Uls5iMM
         FfW0l3El6hPlfO+MYziHzOQg5fOlFn1TxYQew4wZU3afSiItG4kDmgQwjxNb+Pmy2/JN
         7vJg==
X-Forwarded-Encrypted: i=1; AJvYcCVkNOjz+LQbduA4uGrbl+kEUED5f4bl5L+jVYM1nhB/s18TcXrD+udR7KstOc5bdfQhhBU4XDSsKmPvuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz54qiAnxkwP1dCa3qPzNaBw6jTLDo4npjglgG6eUAx2xglsiW9
	xaLJr9mOyzDjCbQukapHQim4ge4W+7HPXrzY8zAG6lgZuTgovMoQCXUfpwl+zopcQ6N094Ny2ui
	qZyjdMoTbCAqZk/r9xKJNwlE7p3UTt7vuiWyQCL0gyaw7p8VuC7c5HB9OUa6RTvwbgg==
X-Gm-Gg: ASbGnctHNvWBZPnu8IpVs03fdWIaqW6Ro/O8L3AZJTkoMV0aCdGKUbviYog6cy+goli
	0rISvtzRrSCiZoiwy1Y44LBWuNTkGoEyYViMx2GweQqD2hn4ftMW+HJipfmFEsF+qPngD8gU6I4
	pNLdftIqsOdD4i6qo0OeZkGVwzgjGvhFWOR7dolCSIp0gNrpmu+JaDw6dJUGp1q5MSchTyZQuFY
	ddKpwUBGDTgslJC9CehzM0/7X2ucHEmiGUNAM9+rxHPeNdrww37M/OH1dUBKPtD37m3XI4Xtp3B
	WwDUFJJEI74cZX/cFB06RWH2yTUkDIkvliXzUZ0ls8BbZL9DATRFdhnK88F5Nssh08sJNG5lbVz
	XavVL9FzfT7N7K0I1ohDQKgJ67dzx30FQpO6rSM46RU2+4Brhh+UVyNHPKw==
X-Received: by 2002:a05:620a:28ce:b0:809:7ac4:e5d with SMTP id af79cd13be357-873751a3f72mr827105185a.38.1759375259131;
        Wed, 01 Oct 2025 20:20:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+9KdqXQAvgAy91aCrCBMNPDEVwnU2TL2BXZwwnc5jZ0pwSHdM2Q9U86P8T0TmsQ3kUHLwbw==
X-Received: by 2002:a05:620a:28ce:b0:809:7ac4:e5d with SMTP id af79cd13be357-873751a3f72mr827101885a.38.1759375258476;
        Wed, 01 Oct 2025 20:20:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba4d4ca8sm3459121fa.58.2025.10.01.20.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 20:20:56 -0700 (PDT)
Date: Thu, 2 Oct 2025 06:20:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 supplies to simple-fb node
Message-ID: <pbu36yoruuqmik5pzpk3jcl4a4kpatigrrkoco3ikf4npvm7os@soqqf3j3m7yv>
References: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
 <20250930-sc7280-dts-misc-v1-1-5a45923ef705@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-sc7280-dts-misc-v1-1-5a45923ef705@fairphone.com>
X-Proofpoint-GUID: YG9qwtLkwiLxRJlB9ToOTc8YBpofbZ6g
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68ddef9c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=4pzNktNMXXEreR8vy40A:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: YG9qwtLkwiLxRJlB9ToOTc8YBpofbZ6g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfXwf5CM9YmDEoQ
 tJh/OAZR62h0dnYzzpMQW3dUe+asSB7sDnoW9RB3qCkd5RorBUxQlCfxotGiOR2PlcfErZQcmL2
 feLe88VLqoU0frFVtgyfhWOPcqCghhChzpuny5zfgojw5AzuZkiVYiXrH94J8WYqnBsvOfXFbpi
 RjlM02CAIbwAuWlw3yG2mKu4Zz4ZZ998iPw0XasoNRtNKdl4Vc3dDCmziKTefDh7olFNF+PMOG6
 zjsfYeJe319VYeN1bOwY0nACVE5LyLxVVTaWkDH/YOPyflpmBBW5+eJ5FBvCp/JcBuXM47PhXTo
 6Bp0AS+ru5ZH9hAyFsq5VicBwh9lS56Gfybj0DtcK1nmmQLZ3Y5GFBCZvAUpzwYffHAkOP7vCL7
 18syzRnl6/hB08mfoyqh1aT0cdlzjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036

On Tue, Sep 30, 2025 at 03:57:01PM +0200, Luca Weiss wrote:
> Add the OLED power supplies to the simple-framebuffer node, so that
> the regulators don't get turned off while the simple-fb is being used.
> 
> Fixes: c365a026155c ("arm64: dts: qcom: qcm6490-fairphone-fp5: Enable display")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
