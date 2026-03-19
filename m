Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E293815DE
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 02:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773887264; cv=none; b=svcYaPnJIBmBAEQ8bgKNBqOs6sjtF0SjdE5Yz8L5mmVII9PKfqbLWzQWp86r2uhwkvHGVnh+iqL9RLvM++M88iXCqnnfZjUWqFM96gJNN+ZnGZE9UCPfH+UTPB6NEb81bYNi+QLlh7BFjdE9IXEpTYYqO1wg3ODacCzWz2RZ21o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773887264; c=relaxed/simple;
	bh=CLYx9OzveIAuHQzq0XKepFAds20XZEpP2l86LsmmhGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYXOD7rCVjNKrdNpyRpnvs7XmGgedYldcYixj+JQNtX8PwToSAE2rjmKkm3O+0rzvqNPualgZJe06kzg4THSSDl+ywyQZolxr/C24oSdicf+ZgL4fZe1xVIKKSM9p2d/8qlYeX6NoTjoUmTIa3ihaBBxODYuYxLlWDgeR+nXck0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ik6rhIdt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UvSDaIdU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ik6rhIdt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UvSDaIdU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62INCTdE550626
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 02:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8O84MM7Ovnlu/0HHNNMnw5tm
	T7h2j1DRydnOIymi1eY=; b=ik6rhIdtW3S0mmxlnkCXTE2Z/iGoZUIH5akFpEFm
	cZ2IKtDAvWMdBNaPjUYQL3qtaBgCuuMED1NZxOCyDR0gHgd/Cvgj9GI6LuHUn7T6
	6eHzQnmntDvNWonmKiLZ73cbPYuaauU1ZeP1hPl+pnneoOSFPlHspBUFeuatxsA+
	pGXvF9YcK5AwymsnNhA1BNookp4zexMEdJ2e/jwhlm0+ViETWgI+v70TXFkQFAs+
	lwsJUD5VwOyBlVs0NoGJ74LXESRPVg+KN77QlXZ3tQLglnSnUg6hzz7MRTQ+R/ho
	oaeZaFRVdEMQLu6ydHLQ1V9ANPKOCyHp/DfZ7JSVdfVDAA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4g53c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 02:27:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509070bda13so85810821cf.1
        for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 19:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773887261; x=1774492061; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8O84MM7Ovnlu/0HHNNMnw5tmT7h2j1DRydnOIymi1eY=;
        b=UvSDaIdUZ9x/kI+6V8XusJiWVyGOAb2cdAdIdAF2/RLfQ4ogM6O99JbscvJJviG6/m
         K/uoHjft+CZhctOhz/9cuLh1BsXd4e9UUCpwuo4N27VRaZ2Nj+e5fl81S9XAOOd0GiYN
         83RFutz3f0u5cJ2G4Tdai+1pp+0iwd6B5R56VyoSx1TWI5efhhn9yjgzNPJkGAbH9Q6A
         RZ285ygllnt80oqCO6JUI9OHszPrntHgqURBZPLzdXMW6Cs232hI3jmDY2Za37MS1BGu
         Vy8VeZdZ51lEu3p3AQ45/SG+gSM4ktfkXMTd7z/+rHG5iZ7kuImEZmrkbVo6pgnrURm2
         Qw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773887261; x=1774492061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8O84MM7Ovnlu/0HHNNMnw5tmT7h2j1DRydnOIymi1eY=;
        b=OJK3m+g8ypg9mY5WagMjn4FHEU1f4+EPSyMcghlqtV4zgJ8i3D3uJ+pKtHS9Mcr7vm
         pYr00elcwStcMJ/tV6pKjKhMRxo6nelcUA0vEm/25pIRAuCxubZhCqAwoVPfZgbRw09N
         wZO04/CXEMENuMAkaQKV1AFATASuf658/pGslFoD9O2Hp1pKxEKn320X9c1mxjHctrCL
         zgB6kbua4MF5lpC4LBDVCtNNOsvdMcAO86npMD36ain/yvWgx07RGMYdOfij29MKgde8
         GqqhqPo6u1svM5SHjklL18l0a1HLw+SFIvHjqzayiSA5UOubhUWfBwLRZTZvSkt5hjTY
         A5rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgFRl0bpZmGmYU7pYbLGZCogjeFcl/9abJqs1YhkSNYE6WId9Ustl2Ir91r/iIThOr7pmlzWZq2t74fw==@vger.kernel.org
X-Gm-Message-State: AOJu0YynGVtkDDFOzfUerevEWd5JHsULH0L23VXsOlfxLOzIk1CoXb7V
	jfAykrfzcXaYoBcv+qcVrkycPksIn7Kbm7agJ7Qpa06C5gp5W3F2Fy63RhWIdU8n4ar3XVVV4Vq
	Uv96N3mZLbgP0tmJ24KGHeoWAtBaqDktPS2YAtwEK+0pbdHVeVLidGMHwsRZsHOVk9w==
X-Gm-Gg: ATEYQzyBi2jwxcm9jnctbec6LzlWH0qGnoXxMq+I/QgkK8uUeoVJ/pgR5ytRVW033r6
	zOnRUwy/L66V1zzhej++Jr/Iptj6ZDDm20+Dpwn19iNWiFG8Jxe7B3HlXPEIl4kpW4wD3alPT02
	gzonyh9ekS1NN5EZ+8rGbVFqrgfbwXBBeT5rMCjmfYYI9RWHwterV19WY8OmcFcre2FzP4wGfBU
	4t/i/AGL5yqZpc8mpV38TlTOyKVAXfXCtQ2Bb5YHrM2LCxdwIZ9pa6A8sIqWMTyaxRHaT8QbpOS
	9zVq0LzI6uUvs+iQlbn+z19xGZwOsb2biM3KNgMVR6Dkuecmx+u7pH7uoFcbeCPmQ8JGqCzRNqB
	dEd7PZktctlssXsfxI8QljcDCgXmwiKE6wI3yJW5pt8UkGTJ2Ws6IVbxSjp9NAt8A50KtJNBHR9
	SDMyrpaujz04HJTcWVXcDfcmMbl8DBPosRGgg=
X-Received: by 2002:a05:622a:10:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-50b2461a932mr27523631cf.14.1773887261241;
        Wed, 18 Mar 2026 19:27:41 -0700 (PDT)
X-Received: by 2002:a05:622a:10:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-50b2461a932mr27523291cf.14.1773887260769;
        Wed, 18 Mar 2026 19:27:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c2d266sm873523e87.29.2026.03.18.19.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 19:27:38 -0700 (PDT)
Date: Thu, 19 Mar 2026 04:27:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci@protonmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] drm/panel: Add driver for Novatek NT35532
Message-ID: <byxrw5g4t23vivbt4xxpyfcsbrmlaju4lqqwsc75iqizoqmt4n@ltuwlggbitye>
References: <20260318-rimob-new-features-v2-0-c1bf8917449e@protonmail.com>
 <20260318-rimob-new-features-v2-2-c1bf8917449e@protonmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-rimob-new-features-v2-2-c1bf8917449e@protonmail.com>
X-Authority-Analysis: v=2.4 cv=TPhIilla c=1 sm=1 tr=0 ts=69bb5f1e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=sfOm8-O8AAAA:8
 a=EUspDBNiAAAA:8 a=f_kZLxWr8KFBRA8n9fgA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: HVj0kzUWGYVwjFl75aJY5JwrFHkmpQe0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAxNyBTYWx0ZWRfXzfz2tkEJiuPZ
 tee10InPIE3HqNpJc5FuOWGk86WCChGIkg/tZs+IUKtDL5bVeDliJRvuo8yLnEug6DzdLwuLkye
 nX1W+qh6h3sVsvgjF8GA6n5KI7vV7j5NO5xYG5hRolKgYTJQYH+HOH8E5pntutMDU7sF7GZzjZF
 zjxPl3JY3fD8x/rQExUN70pd9dWDpnWGFIZBkbir1aq0MJKeBlRC4mHZcSklkE3JkeaEtSHCmim
 jfkrMIwhXH8DrzJIKh/Kf7haL6R8mHUjYZv9U4nv6dmH1YdfTaGCdHpLwQ2cQ27QV70agQFoYDy
 +YJchYomO3gqKT0zQk8Gp546urIbLAblk1hWPNpog8FTjIq9Y/Z8CTJ+pVUS4YmINIozR8cgY7B
 7aKG0F47cuR1KVVoUsVDDlQCRQzFOJvdiSmsI5Zi+9c+4VDQBzX/mVywcuiwZdYtbMJ780QKzNf
 2+kIvqeJnDvstNynuMw==
X-Proofpoint-GUID: HVj0kzUWGYVwjFl75aJY5JwrFHkmpQe0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190017

On Wed, Mar 18, 2026 at 11:28:10PM +0100, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Add support for Novatek NT35532-based 1080p video mode DSI panel.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/gpu/drm/panel/Kconfig                 |  11 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-novatek-nt35532.c | 779 ++++++++++++++++++++++++++
>  4 files changed, 792 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
