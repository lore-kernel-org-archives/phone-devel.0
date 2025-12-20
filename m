Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B558327F01E
	for <phone-devel@vger.kernel.org>; Sat, 20 Dec 2025 16:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766249531; cv=none; b=aTx1keoQizlkbKmvUv9/5gNsCODMhPvE0ZMuB6YJNfigNcTtoTNn1kaRtv+9iX7pCJABhh6fVdQztnhIqqN9LWrQMWvnBhT8DT32+pW8d2vzzX2b3nne/7QnmG6aTlhfVvk+uKl0OQJm4Tnr58IZ546+9BDRdiL7o76HWUC6ONU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766249531; c=relaxed/simple;
	bh=OPq2jgXtjTjqBqxOYiuLvmvpLqAJDVsRGupbqBGx7rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iT7LIBQ2/RkcsaojWVGIc/ptSXuiB80KpeaUPJvNwEK2s3XWZyjB6EJtkkPXUbiXxniKz6GQ9ofXMwXoz8GtApQb9yQyt0TuiA3dr0t48o7AjgtoNa82sMtOm42etIYdfj3uMaNa+9/ixLeny/OzukeMziF3Y5ur62uVIKGdmjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lew08moB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eDUuAP7P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lew08moB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eDUuAP7P"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKBPxYJ3199057
	for <phone-devel@vger.kernel.org>; Sat, 20 Dec 2025 16:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=md820MSJFmMhxzBhoy9K+H94
	1G1BAf7npRq1mwTR9kI=; b=Lew08moBKmsRyNrL9SesOrsXUaVNS0HMRZ6xjred
	dIzNReB6N8e/4pAtN4YPXoTQR6By4GSvBp+61ubKABL2PmWQk8+SR8swpBmSHbbN
	QfhgGr2697eMHBLSs9TYNAcgC4U0NpgdgYk+WGPCRM7EFJgoHyX2vMCw2Q670yrz
	55yenpkIGWRxOnV9Iei8/HLHV98+BffG+4SdXsVnaEMNkWVkZxXs6YsDYAjRwzJG
	FKrW3pQtblUqMgk3I9sTqH3BU7KD/EZ1GoQ9c4styrV2QeWcVr8TASDSHVs1umf5
	Kl3UQmcl0aB5ulsv5svVbeRcjyyTFsiVvVy0Ifs55vncAw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5n36gybt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 20 Dec 2025 16:52:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6855557aso85098701cf.1
        for <phone-devel@vger.kernel.org>; Sat, 20 Dec 2025 08:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766249528; x=1766854328; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=md820MSJFmMhxzBhoy9K+H941G1BAf7npRq1mwTR9kI=;
        b=eDUuAP7PYK8x7i5RG6R9xFIxhRm+sP+7Wb0inki1JaA1OrrKNaki/e1gf1aNx0EEeF
         B3yGTA5mDr8+gIs3WaCmbe4/05BnSETAz3tjbXno8a2KQcu/BF2IG4ZszCaQ5rmzHvKP
         K/JovzF4D4AHWG9sACIy2yPiF+R4xTP1941exQUREbrIOnnL/Jvskfq9BdB4PwVB0tpE
         Gm7oKnGKNGMK3cpIfiWlauhAm00iuCDuCEIMWRkplSpVcG9+a8QS0/Bgh7YFQs6tplAJ
         FOwUroJvwJtDRDtMIHELouV1HnhJnANQxLTyGnY4r24bn72h9vPKCXTOGR8Fo4+MHrIq
         XmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766249528; x=1766854328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=md820MSJFmMhxzBhoy9K+H941G1BAf7npRq1mwTR9kI=;
        b=gA77032AR1ezt4/MIAhXp8hU/+G4TUYfZVnBQXV52pO/GjaXC3F11u10K1ICOFaUUo
         TycjosbD/XAPHxnFe60a7OtdfLaHw4/FYTRJkVlKdxfHL4FegjbQZXOlN209FoSJ7px4
         yMFzXive5xxLY5MS84EnqcS0Lv7yH6FzLjuwnvt36yGz5wfCSpCBVX76/hcGRl6UcSLX
         Sx7CSSYWwYQjrV441q20fmG3b34UdEwVxB2PRDiUm6S7Rfnem+hND6XTfx1XWmij5bFC
         aU0wnxqSTmYcJha5zSxHVODcT9debc4vp6Zjt4vYz9P0NUfLeQh9WZpjfZwoJGaNhXEH
         LUHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAU7CB4V7kXbBAEFjc7Cv90ZOfbRJ9ADlQUaqyvglwk6pvwDbLtcfPEGo47d91a2CW1SeKoGv4zwBnHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyxSWIc6xU/Npdsf7g6UuY9dWszjh3NjVxgM8E7PDu/wYjUJxN
	rn2HPpVPge2K+Ls9hj6sif2+s+2wvoro7LjRgLbpCJCWx3Nezp0E7xv2KL/KByXrHErz01Er9xV
	mdmOEF9t6pDGMTPOkVzsPXFHyB3PxSAxWS262lm1PHkc7suD45z1AofWl2xfHVLLACQ==
X-Gm-Gg: AY/fxX616vKccfOFPeybXjCV+32BtvxaUcsbauJEfERhUES/nmwEDroS8rv9w6J6iFC
	v/kWHhTiWyfdff/ixidVQo48RnJ0LPORfwBCm/nNvawHkixBOjP1sWNc/JxNVksHZdnRazWKL67
	q9sWwS3ZnZpTBZFTEdjbbyKqYgDAbUsT9n9ZWwtjjem32qyaNlEjhw0/kX9SLlGr6eEEYghyawT
	MTnKYsDD75+KkTnLNcKGygC3mlGE8QouqfUHINCmjjHoaeLw+jx96cUX5yAt+UDzXLZ6HHC1+RC
	4rYBwHgYWp0wAX12xcy6kc3BysMYHNBbXx5lg+z7L6tsWnOsaLjd90u0TtGR5i0vgzoHMcK5QTH
	OdmJW890OrALjHRqDZDy1tve2Q5MIYLgm9NCtDvjawsTKGd10WflgL0SccyFDoh6y46xYEkYZnD
	5AqU+cM17QlDZB4yv3bHfgNh8=
X-Received: by 2002:ac8:7f81:0:b0:4f3:4b53:a917 with SMTP id d75a77b69052e-4f35f43a9damr148411911cf.22.1766249528037;
        Sat, 20 Dec 2025 08:52:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6MpmVZ7ZQhZ40pLdCdrBIOL53YEAOVIlZxLQot31bDGrYAK4K35/1+HqCakHdqkzMA7+JTA==
X-Received: by 2002:ac8:7f81:0:b0:4f3:4b53:a917 with SMTP id d75a77b69052e-4f35f43a9damr148411641cf.22.1766249527582;
        Sat, 20 Dec 2025 08:52:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812262b36dsm13394911fa.30.2025.12.20.08.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 08:52:05 -0800 (PST)
Date: Sat, 20 Dec 2025 18:52:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 3/6] drm/msm: mdss: Add Milos support
Message-ID: <475izg5bi56oefqtqkvqeyspx2por66zrw4tgqbb3f2ziaghyt@tccm73sl2u2e>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
 <20251219-milos-mdss-v1-3-4537a916bdf9@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-milos-mdss-v1-3-4537a916bdf9@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE0NiBTYWx0ZWRfX1xKlL9Vn+46F
 Hr9d2SFaiICzPa/lUWUOMPsJYcKXiouV7ApXK57VGW1J7XL1rX8Ut76kk3b+FBW5gbCY2G1A8O7
 ATl9sDdowMWbc1KzGjUUCPvh+rSvLB9fMxJL9nWoQjxRCZVqcb88P44/JdtmIrXk555bNeM2MtR
 gihZF9g2eC3WErjQuOxG7pz7j55mAIchJAIE/a3aPzMBqTx5LyGD9FVg3FYrddS+zWI7PmkZFvO
 TEsQ6duVF0pCdpPrtTVGZteL+hoij8+eFJ0WQR7JpbUbuFaK2ltILo+l140geBC5gTVoSPSWrm8
 tEJk41V8aU/6AybvE7VDKNrfxO75O2ywR9dkJTu8Tcsu79w6bt1DtiGZ6MpbRA5vaJeEllq+CFW
 uWhxrQaiaZ6oSwUu+cpTG/8DpWOciFPH2kZS/vl1aOxt6N61c1TNsqfNuuWckQisAwC9jQqRtLa
 cIYA9tEblxI70EEjh5Q==
X-Proofpoint-GUID: 2AA6mt56Ds0e7EclPxqsmwlGv2D-5mgp
X-Proofpoint-ORIG-GUID: 2AA6mt56Ds0e7EclPxqsmwlGv2D-5mgp
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=6946d439 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=Ybx_Rsa12JF0X6GijNIA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200146

On Fri, Dec 19, 2025 at 05:41:09PM +0100, Luca Weiss wrote:
> Add support for MDSS on Milos.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Though 14000 seems lower than the value for all other platforms.

-- 
With best wishes
Dmitry
