Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4207D2C3250
	for <phone-devel@vger.kernel.org>; Tue, 16 Sep 2025 10:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758019870; cv=none; b=pD8o/eAyxc+/5k24hcEfSo3SfGmcBemYF4ZSjn0IWwx1nQ9FR9Rc+QOJ20lLg9SFw1lnJZJQyMlKts3dtxsibTFGQALZ3EuH5Hvf3FOjWQUJUMJw170KrwTalR9rFU4TtjxvMWO6Z4wX35GOVZ1iNO6EPTGNt+8yElchap6tKsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758019870; c=relaxed/simple;
	bh=kEfwWe+VHc/Nr7dgeDGRdbm0d6c2a2tZk6u9cmKA1oI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9f/4pZ3yyL5pr2lb2r0GMZkeZj1hNIDt9JHXKh0xY2GjVnpfkKA4DoVeaNO3BaQ+2Hcxv/+QJzfOPdEV7eNITFklWsRROZOVjUjnIp2nlwyo5pUdXMXQuZLjuFEaYNlR0kPzPCoPkXSF5+WoJsNpStemm0nH1uuXLBsSQOhbKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b7B0bIps; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b7B0bIps"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA5637021250
	for <phone-devel@vger.kernel.org>; Tue, 16 Sep 2025 10:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2FWNiMd69SOkpVvXV5XEQpKz
	vB2oZ4Z/GeoK8cF0vYc=; b=b7B0bIpsG/JCcvNB2e1mtJylW/6MvvYxPj8AdmLC
	ieflZFyo1A83dp43fAOjOyV5DvEXR0mRAs99zMGkPdhJcwzcO8iRPBGEw1b9BVmu
	C22vowFK6Ndu46h1AxG68eC0QfHDvDxKgPHlAnU2Y4/I2Ec0m9Cg4Q5Xy4g7ZYfi
	yPWCq+cLnISH2WA8olDxyROzISdm0SVfqY9iJIzKz688waklo4GcAtPd7IncfugF
	3F4ycxVBMea/B3xLS3UCL2+XdL5/lf3WxSSjjD93m0V0W3wZefv31Zk9uMdtyarA
	swQBL8nFyrcP8EOPCc0a1R35Ym9IUrCQLv2S7phXS3AFaA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496h1sm361-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 16 Sep 2025 10:51:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5e178be7eso149297371cf.1
        for <phone-devel@vger.kernel.org>; Tue, 16 Sep 2025 03:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758019867; x=1758624667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FWNiMd69SOkpVvXV5XEQpKzvB2oZ4Z/GeoK8cF0vYc=;
        b=ct2hzN1jwHfbBSqTomzxZUXei0UR8kABSNDTKYG5ljj8m/usXVd5bS0uSdJlRzdi6g
         +JwKPw518Lb55aVlU2ZdJTbtRzdhquGeRrQJU6NixOWCGrepeW03fwQZLbjzrRyyyh2S
         Af0ZyGRfDo5+jEAJ1ysicZ9jw63sTSyMUV7JldZ4k1NE8OAKFpztYewUDdmIUqwViWkJ
         04AMmhTI4gHNly07ZT7RfZp+uoiR1ubgMishOVkkf7hsCdvmTvkkJ4aN5YmL6B7OwBKx
         BtF6h23ppirsxn1zXcci5oeHoTiyHsoBFH2AII3KQFwA2yZEl3a3gmHV+FA+sVLRfq7f
         vH0w==
X-Forwarded-Encrypted: i=1; AJvYcCVgdeaY8trLrKSij9xZHddjdZGXTebq+pxWr1ho8LvmfioI1l/WfRq+DyKpnQMfte+uRnDGJnXmCvf6cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcfrkEc1yi/7mCAvvAgOaA7yj/QT+I1j+N7IlP/PtdAP8ouaho
	6btEF4JzPL7tAQcUJ5iIVLK1oQr52bpimxQh73/cVszFFdNNTHA9eVgHDsgcZqoz3X2vIE8MkEz
	w8QNsz7/YzrOp6arpna8B8dfKFqd2ZH/9LIcmuhSI9iHne4iB4SX7E2O2tvrJZp4xRg==
X-Gm-Gg: ASbGncvhshuDNh4inHnjM/G5WuL3WnyuMs0JXNVbEcJQmBYwBHmOwmjI6jd3hnnlC01
	hsIlgdDwQiTPm3xN8vbNVGYL77se/Fm8oUFj5pm8tHHXOLQG1s8m0TV5jyZ1QkVe1GI8TngJrGR
	+e8c4wSZeJg49i1BkrTTntbmmsORXY0448y1OWQOoKDHSKhXEfShqtHtltEgPuE+/LpaQxQF+An
	WDx4ecAVZGHE8JIDEVOihT/ZNM8zOTwqOv7/+ddL0lgQcE+drD5XACh/7zh/hFMCkjy2zSp6zEO
	1rYUNxCX+9FyKohkCHQLRthw81+kHW7s4P93XQlISajxBOZBu6wF0hOO+dymX6WoOTxELT8pYYO
	GJISb9SgSVaThYi3B6FAKIGzfENZndTeya36KSbeG/+aO5vebCLcw
X-Received: by 2002:a05:622a:2617:b0:4b5:d70a:2245 with SMTP id d75a77b69052e-4b77d12aedamr217457301cf.77.1758019867449;
        Tue, 16 Sep 2025 03:51:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLdtaBJl4Dq2wLZch+XJIZbmZ+n7DyR5fUUJ0r2GfTbCwlwe4XzrdpDgcxuCfKBDWHawqRQg==
X-Received: by 2002:a05:622a:2617:b0:4b5:d70a:2245 with SMTP id d75a77b69052e-4b77d12aedamr217456721cf.77.1758019866821;
        Tue, 16 Sep 2025 03:51:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5dba7604sm4325333e87.59.2025.09.16.03.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:51:06 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:51:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>
Subject: Re: [PATCH v2 2/3] drm: panel: Add LG SW49410 Panel
Message-ID: <tu26qvyzihyknyzjeu3ycz5fm5mddlvmw776tjbqy7qpguq7hk@unfyoqd65azd>
References: <20250915-judyln-panel-v2-0-01ab2199fea5@postmarketos.org>
 <20250915-judyln-panel-v2-2-01ab2199fea5@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-judyln-panel-v2-2-01ab2199fea5@postmarketos.org>
X-Proofpoint-ORIG-GUID: -FHMRa8LMyZPnjFS3vcFIRAfuHohRgbU
X-Authority-Analysis: v=2.4 cv=A/1sP7WG c=1 sm=1 tr=0 ts=68c9411c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=sfOm8-O8AAAA:8 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8
 a=XYq36MTTh7cM02dhETgA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=TvTJqdcANYtsRzA46cdi:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: -FHMRa8LMyZPnjFS3vcFIRAfuHohRgbU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA5OCBTYWx0ZWRfX0gM/G1OVwwhq
 DezXdZINQ6aMaGlBf6D5VRk4L/b2cN8jk+CmeU8VtxW/YzeIFZEuvsbtvejAtu4xAp7i/GngRiv
 4xH2rMfFy0alCEErDpWr3Wkm7PeC7NRzb0z9yJyb/jsuVPUSrNiaIhbrMD4R11tAxvgU/uNvlGO
 yLqoTZFIIe5cDVTorOr6Iz31vOEHqoeUQNR81BiWs6Rq7/DH/Xw2YiTE6Gp7pzBnngmvLn6GWCX
 2U9o7cUGqkZ1QTCNbSMmkIkhMKJns2LIVr083ka0uH9/HKJD2DlnlwZs2+/JWcxCMPvHxdT+ebA
 Nv/oOEGAF3t0viVrmsfI09ntPfmfKQmeBpDfBTVylCu2aiDsskHUV8YZuIGjSs39ofwMJE2eZHE
 6oqV9OQp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150098

On Mon, Sep 15, 2025 at 07:32:13PM -0700, Paul Sajna wrote:
> From: Amir Dahan <system64fumo@protonmail.com>
> 
> Added panel driver used by LG G7 ThinQ (judyln)
> 
> Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
> Co-developed-by: Paul Sajna <sajattack@postmarketos.org>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  drivers/gpu/drm/panel/Kconfig            |  13 +
>  drivers/gpu/drm/panel/Makefile           |   1 +
>  drivers/gpu/drm/panel/panel-lg-sw49410.c | 502 +++++++++++++++++++++++++++++++
>  3 files changed, 516 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
