Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D525925F79A
	for <phone-devel@vger.kernel.org>; Fri, 19 Sep 2025 17:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758301268; cv=none; b=Gf6MJ0tvGhk287ByCpm0RTChQpE5GKGz4FGZOYojo5LS5ZzVir13reMrcHwCeCCul23YlLdKvAAViXyMTvzmPWaJzxEI6DuQk1XlRxloX7hQgeZcQhXPGgNpGRKpAt/04KCEDnZi9o2MOzdYIwIFoA2uCWpFQ64MlmetJt/Tctc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758301268; c=relaxed/simple;
	bh=Y7DKAZiT2YZkSJp2XiHhkr0pQT76qG9tSnaVyBpEkpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qdRjIPUH/7/GbC0D4Lo3RQ14FshX3cjWvL1ybb2Rd7S7/BOwKLjzTyogOydJ+hEN7yfNMr9XmNA6q0BwGPTX0zok4OjuWP7Y4KvMoOD/4mpGYxxsGTsVv3PwCui9QF05PDn8abnbp7SDMs69vF5p0k9COuzWjS600Vr9Dtx8YDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LkwbJwgr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LkwbJwgr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58J8k4ME028290
	for <phone-devel@vger.kernel.org>; Fri, 19 Sep 2025 17:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gfDFATVzLHxL3rjSBMcDlDZ8
	Gmp6IwIJVpR9vdm9I3I=; b=LkwbJwgr9Nasieem7nMvMqGZuqoKPJzLMKGtKtZi
	xoLeuGbUNfp9NSB6BFl63dMtv6IDP9XNObPSL7h2aqn25iKIsWammaMm6LkfCl3L
	mtenuHbSwyGmsvtkYAGIbjn5a70ogViaR7aGlTtTM9W1CXFce+n3Sj57X99FG3Y1
	A+S6AQCHpYkSxZIksL0VwX1LusPR+9ysUt2Xvbhw6z0p0UWVgpOiT7+3zHLshKDF
	+KlLiuOfEeVGX0dnfk5T/Me5FyWHnbVne25Y5SSjQfeAth6goPKf8lAxM0zpKL97
	uXy1G63RiY8WOwr3v8WaOR+Swn7kqBhGZhkOj09WCFV+6Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497v1jh62h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 19 Sep 2025 17:01:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5f31ef7dfso60575341cf.1
        for <phone-devel@vger.kernel.org>; Fri, 19 Sep 2025 10:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758301264; x=1758906064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfDFATVzLHxL3rjSBMcDlDZ8Gmp6IwIJVpR9vdm9I3I=;
        b=X4wp7Ia5GjhoFsylCVh4+Vog5n2UsS8WPMJ/WNitYxSwgR7P77270UyjT2WabTdCDB
         ZkgiwVqeeP+4RpL4gASpabmPs53SJ5gKOFirXWJlKv7D0pZe+GemKqEHh9VjqDkmh/DI
         EZx10Hd0TMBDC1dyrOlYhYTBqh3l/sLaaxXRJLa2iqBCIcCjN+IVH4Jm+r+OwjtfoFMn
         AKrMoYiHZvK8gx7D+gkGLUxvkcyT+/Dyd2mwixZzq8gSGyDbOxIHYlTGnBs3B3vhMO10
         qxvNWgBldiXdvAh/jWcPWFNVbQsScMOV2S1BCyyuWuD0ppYl8lBKZBLBmXPNLT+EJqiL
         wo2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJJWxdwIi1O7MY0QH8fdvaPKWdh9B6hwC8nhcsBxnhzLHqb7LQhfV9dIvQoTFYv8oCJS+HL/sXTFzGFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7daItA+69kbifP39HL6BVrK0OM0HvGiTSOSu8Z3pyNiOEwc8y
	+NZA0Hc9ApxIB/GRsWnCXPyJysIPUdyMG+HJRBXqLTXqZXwswmw4DapBzAjSd4WA10uffzEwLdz
	JmERelcuwlD9L87g+7Bu48GMX62E1mLJ9SJibQtJd+7aE2ppAocHtodg97v5QfWgBkw==
X-Gm-Gg: ASbGncv22j2LCe5JHgSmmzgbtvNsfRZomM4WcPj8NejaBNm+xgMX+LWh5fpgHAAAjcp
	TayHipIs6BJXSwLa11t7R02q25YNrm0+LktYPfzMn2DkjaTpdFlnRITDjrQIhbea2Yr4/iXye9T
	aFnKyYfMF91wTf0/CKyeMvTDJUwGvUS0brRw6KUhK4IJj33x/jsDZy3gADVcqwgbsnKqGXUls0X
	yxYL3aWw2fagTquDHa0lwuYAzWXUP3Uqx1EduVIkyK+w/IlerfyQcbxlv48sw5v0f5hxxjjbQCy
	tSyrfP3dTDzvFTPHvF7MLiXaX2fYmJ1agnIyPramq4/Jru9QeMZIQxJUAWC1KXQiAsCx2Tqu4EY
	/mTZygfwTshXHqG/axihp+g2OZ80m3IolOFttQnRWhNapiZnE0kBc
X-Received: by 2002:a05:622a:1994:b0:4b7:9b0d:11ac with SMTP id d75a77b69052e-4bda971d81amr84082131cf.8.1758301264008;
        Fri, 19 Sep 2025 10:01:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGvIhD0JxWZnIagFrRbczAgFfT70uY1KVYP/SGm+8WArapSfq67kdLR7qEtf5eIC6XHqkQLg==
X-Received: by 2002:a05:622a:1994:b0:4b7:9b0d:11ac with SMTP id d75a77b69052e-4bda971d81amr84080841cf.8.1758301263027;
        Fri, 19 Sep 2025 10:01:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a5f44a3dsm1523174e87.29.2025.09.19.10.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 10:01:02 -0700 (PDT)
Date: Fri, 19 Sep 2025 20:01:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jens Reidel <adrian@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>,
        David Wronek <david@mainlining.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 3/3] clk: qcom: dispcc-sm7150: Fix
 dispcc_mdss_pclk0_clk_src
Message-ID: <z6v7vi5kiudvfc7es5whzkfhn6c7ozhxw5u7onp66u7qd7utnx@cwit27ppu4c5>
References: <20250919-sm7150-dispcc-fixes-v1-0-308ad47c5fce@mainlining.org>
 <20250919-sm7150-dispcc-fixes-v1-3-308ad47c5fce@mainlining.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-sm7150-dispcc-fixes-v1-3-308ad47c5fce@mainlining.org>
X-Proofpoint-ORIG-GUID: QuMEYP1-SKqisdVwXxz-4SExEQiVLR1y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDExMCBTYWx0ZWRfX5MTOsvx6HDLZ
 KreLsgg07LtH+lmVoO2kwOYAU+qNk91UWgmFBL1roy5lwReNBCOBm63dJ3uomPvJ7WI8d1n1rzj
 yduMtoPFs9C+dKOJeB+NjTOCQYmNo/BeMCCyGuJjXxIzzMU2AF9KUCMoAl7f/aI8+ONwYBz7B1D
 unaJcwSqhfaXVyjVp1skcqA2JjVSanDdtd/8aYHxUFQquk+ZdAco98O+t0VF3KH3ohq/Ln38lxX
 TTxQnGZQgOE91cXCpD4wILbmMtwkA2GgnmDK1eVo05E64eS8E/5yCYbs3NNEYKcr7jwoEWaNz/k
 jiCy9/xnc/VYLJsqIsNHDo/0yTyG6QCQGLruFV+eNXLAfm7v4kLQyOvQoJVQqfHJSJCXl81eEfR
 DSSmdiPv
X-Authority-Analysis: v=2.4 cv=AeqxH2XG c=1 sm=1 tr=0 ts=68cd8c51 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=vcgiYtMqkSy1wNhQ1XQA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: QuMEYP1-SKqisdVwXxz-4SExEQiVLR1y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170110

On Fri, Sep 19, 2025 at 02:34:32PM +0200, Jens Reidel wrote:
> Set CLK_OPS_PARENT_ENABLE to ensure the parent gets prepared and enabled
> when switching to it, fixing an "rcg didn't update its configuration"
> warning.
> 
> Signed-off-by: Jens Reidel <adrian@mainlining.org>
> ---
>  drivers/clk/qcom/dispcc-sm7150.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
