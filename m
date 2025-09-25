Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1340F233707
	for <phone-devel@vger.kernel.org>; Thu, 25 Sep 2025 21:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758834018; cv=none; b=fAdfFuGBPeI138hjCCsbeA/dlaL8GArYEiHGASdgRMMafvEWqhNWE0TIFvtjfmi31f5I1EJ/UcANOW6MfnJfqoP5xSDI22H7rZTAy6VlHnyXeJ2ma2xIDdmp/fBegQryKKLog9AICBka5fa3vj/8OzH73JBL7+YwVLKuqrRxEh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758834018; c=relaxed/simple;
	bh=T4iNv5cr2miRA9ws/Q/OPuwuH/G+wg5LNI8CS99kHMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYVHMBiLNW7ckYcDx3zAk8v1R/x2AEPGFHZ1CR4Zhp8e01oNIC+fel3BmiT9KsU8YV4tsoNrq+DsefVViS8xrzHbaGblGuDb3dlrwrTFthpnE3GvG8r7h40u1sD+5RdoZILO+GukVp9Idyz/saTiK12XSwnawySmcV6aTBb0tTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M0VOHOhW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M0VOHOhW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPpjc000866
	for <phone-devel@vger.kernel.org>; Thu, 25 Sep 2025 21:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J0Sf/sBWadKXsMJGTZZ12sEI
	LrsGXuVR6yrh2onEh/I=; b=M0VOHOhWE/Cx9fVGigWqZ3bYbPn0y1apqtVbeGMd
	lnrnbt8IQaVzwyMIw+itSBFXgJJ0XYnavQSHF/Vrmd8aqExIL/6rW03dZcfulQAv
	f23oJXiTbEI3W3VbDrBT2G8PPgXwNxKUnHTKLKkRJaFW0qaaGaLy0q07AM/rMH8e
	/eOeSiWuZQzRBwm4cR8yqWqHOaOrVleQ753l8Fe7BYKuA9X73d1EoPp8iIUX64hz
	zQ7M8Wirx4vT94oRenIRmOUOH0Gf0FW92p6lC3XgoUv6f/IENciZXOnJy2rK9cfV
	vD5fNIxK8JDKaxVBuSw0AjB4L9KPJQTmo+N2xxTZAT/pwg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0trd4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 25 Sep 2025 21:00:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d77ae03937so39246431cf.3
        for <phone-devel@vger.kernel.org>; Thu, 25 Sep 2025 14:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758834007; x=1759438807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0Sf/sBWadKXsMJGTZZ12sEILrsGXuVR6yrh2onEh/I=;
        b=CqExX9CS52GhaXrjQslCn4dk8vnVy9ZBd1UcsF05ZP9ryO1bjtyZ3hphTzbdL3gd/n
         ApE+POnRkXDcgHXpTqW46eK46JDK7buQQE4D3beiHT2y6VzG+EfIsvaZRoPvVu5wAGmj
         nQecYRROCLKz9CsslEzbzZSbWmZ7reSsAanJyiaXvu7Ji4diPIaGJEtaPvW7oE725WMB
         Q0iYFU1xRJwR9+9e429PeYf4fvCzdbXX71rfhA6i5F3ykvejMT35SMoCDFHylCCs/i2I
         kK5zJtzpdzazUhlk1mzrlsqzhdOMNXydVdy+hsW0MAbcMJ6VAVjX7JpokKNxx+JtbWsp
         cyqA==
X-Forwarded-Encrypted: i=1; AJvYcCXfp4FAN4EqQoK6zVd9/5CPFOTtRLe2iYuzZtszyQcVNX6RrkBnChLCK133RqTqd7+/aKeQIlpM/cFIHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YycaBHYp8XWIXl0zVAVtL5rAQmTT+Xjbsn9toLVA+u5vvDSZSa5
	1PFs87XEuOEISsmHVfOXOiOHZzgefOyH8CYe9BbYZLhZblAUvGxvK0U0vgxnALTVFiWc2jJrDCs
	ksdickw6GmNNvhS+yLlCaouGeUnHxdTraGGhRuCQjV3Yxeq1PfaM7u7b2GlfFfEQpow==
X-Gm-Gg: ASbGncsYgBKdmMyJUzux0rIjbCNW3Yo53+00aIFTGWL16+0W7zNtb3VJ8MVlp/4N4k5
	Ic/WtTxOwJ89YCyamKaKETkAOPgXmj+aPuTJbg8SEY7CfO+VNU7D/0gekIH1OMG1jjY+QMtZ6aZ
	cWwSnFE+6A7OOcRLElNfhKu+qiwMeei5n5MCvZKQDwqcctQdtT5cX6N2YxpvCfNAR1kw8OIVFsG
	D/9KhpACnbg4z0xTdxN1HRhwrPp1Ixl/BM8WPh31fK7Rn9YSppUA7Pfgy2EY/4IJizHcSl2zNTg
	+SE4n2sUNsfI6PqE0r4bgTcukLK5SIKGb8HAg6xpSebBlnzmgQjvTGNRIFWreHyeBFjlMTruSiJ
	fy/+P7ryfYcYtH83ywVLKP6ZaxVbW4oUyW+X/vfPp4Uv6OtHScySL
X-Received: by 2002:a05:622a:a94a:20b0:4db:16f6:9049 with SMTP id d75a77b69052e-4db16f69d23mr37264801cf.70.1758834006855;
        Thu, 25 Sep 2025 14:00:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSqyJMyZZeC0SdYv6VOMpLT31YAW82OV1CV5+LhKhpeDE/XPG6jushTLuxUA1OesOxbqQQ/g==
X-Received: by 2002:a05:622a:a94a:20b0:4db:16f6:9049 with SMTP id d75a77b69052e-4db16f69d23mr37264331cf.70.1758834006373;
        Thu, 25 Sep 2025 14:00:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313dd66fesm1110678e87.54.2025.09.25.14.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 14:00:05 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:00:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 7/8] drm/panel: samsung-sofef00: Invert reset gpio
 polarity
Message-ID: <anrdocs56hbunj7ga573kopcol34pw5cklrwneqevpfhhlm2bc@qvih2y7vm7q7>
References: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
 <20250925-s6e3fc2x01-v1-7-9293016768f7@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-s6e3fc2x01-v1-7-9293016768f7@ixit.cz>
X-Authority-Analysis: v=2.4 cv=I9Vohdgg c=1 sm=1 tr=0 ts=68d5ad5d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=RX7N6JFfHuZ5v-HjQggA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: d7QcCnR8mLVtlCAIXt--jAtpg2d4uA4X
X-Proofpoint-ORIG-GUID: d7QcCnR8mLVtlCAIXt--jAtpg2d4uA4X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX8o66lECdqtnK
 RjqcGEwIbWWDBRkk7m57FQjQALpCuWBqUU601CSAhGI4LZk3eiaIIpmXC8uNcQo8kGicwKAquXu
 wRPpH4N+xCZvN/X21KjJllsGjt6wdykfDA0T303WsNyO3C7ZoxnJUbp+YWH0H9fKucXOnzg7Elh
 E99+XGL/YO/GOLzaPzUR4nbkW5CDMbQSb26Fk0003WRys9E60fkuDzir71GRUONY+8HOkUX5NRS
 sr/rhMN7QMI1+cEizn1uumUzwHrro0/RHbAB8p20LRWgY55c5TFILeU09/vOp48mEcuEsDE5cwh
 +hzMvJi3rwG2PNjiJcBqS6eBYRU6CDRnsjoFsoXpUe0+0r4qAqPmim0el9PpZysqGalCZozNUEM
 urphvaDXXOCSE39Tvr37eWtsBpN0wQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Thu, Sep 25, 2025 at 11:12:53AM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Follow the device-tree change for OnePlus 6/6T and invert the reset
> polarity in the driver.

Reset is usually active-low. On most of the boards it is described as
RESET#.

> 
> Fixes: 5933baa36e26 ("drm/panel/samsung-sofef00: Add panel for OnePlus 6/T devices")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-samsung-sofef00.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

-- 
With best wishes
Dmitry
