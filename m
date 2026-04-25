Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B224C364EAB
	for <phone-devel@vger.kernel.org>; Sat, 25 Apr 2026 12:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777118892; cv=none; b=JNoHWXP2ttIkFL5c7/c+EezbS+WErCBUdzOnAsjofFTYeAza+nLdfAUIy2/+nNYVOQoiMgZ2X67h00pNVAwVM9f1gRlHfX4sm+zp2U7X5pXSI/dQbfnffCv3Coq/BdjKHv4d9kl8yIjNi+94EdX2sJ70IyesPW/WsPyrYiGPQFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777118892; c=relaxed/simple;
	bh=NvxO5Q8sd9sdmgIXtyIzLl+izCycmGl1s1Gfgu8e8to=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJ4PJ7PTglAKmV1rMgIY37gupzCj4PS/OkIaSU104VGkjMpSonFjEi+UjLQANwsO2IAiMgExkO3EkcNJ0/J0n6U31l7XkaghGw1bu4JtFeQyg1FyA/nWTmuWbIIrIrpFxfiVuPII8MSCY/BtsholLGwAg0RASmGfGMwGPu/PRC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FK86YGn1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GHwniKBQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FK86YGn1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GHwniKBQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3KFXw1728602
	for <phone-devel@vger.kernel.org>; Sat, 25 Apr 2026 12:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jE1rlsOcAb8mtjkROW5TnXVB
	qCOL8sz1Ss/Eu8mtnWs=; b=FK86YGn1+rGVLm8Gbkdeuo6FcEXV/ht/9MGJlJKF
	PIew6jehBwcaSjKS6Je0KwgDvPK/4fGqE4I+C+g2spo6TrIlYbWmaYdR064zG3p3
	MGy5RJszKZqFCy5Ss6c5InetVCI8HhT1uaS5WjcydDuJo6BD3rxHy8nLL9XeoJ00
	SwCgTrrMOZH5O+Juaif77uB+HSrLWLsw85/1JGx1/umlhpGJ1/7EinWGsEh/VuYI
	oyna8DFkcdP6qlyQxEzSx0HKkeuQ5IV4YkrDyRtyM0icHnMzvmWPL8kDdbBYQHrR
	/dgpEulIj9BN8juMSHm4PSWRe93+LwunRYvE3rvdoxMY3g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkx8vp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 25 Apr 2026 12:08:08 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9587174003aso11339598241.2
        for <phone-devel@vger.kernel.org>; Sat, 25 Apr 2026 05:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777118888; x=1777723688; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jE1rlsOcAb8mtjkROW5TnXVBqCOL8sz1Ss/Eu8mtnWs=;
        b=GHwniKBQTazUvBP2A8sp31jBw+1YVTYKuLZ+nKZX0lp62pNwatkgJRsI6E/8EfonfB
         z1v0LT+kZqF3WFko7Gn+TWoRuOxI2jncHjlRAb6xQEn/tYR15AZUGDvd36IGt83pXGxR
         Sk+YmYGjOgfmJtPL1Awbu9/dLZeDk95b6SFiaqTX1Jo3qW40Zz0KGc8aXhlnUJ1iog7u
         1UTyoDlQcMlPWZg57wl0cFb1hS/eoqTyPq49Fag366pPZOM/A6MZjU9SSu0OghnfSNpH
         iissJVfDzN3MuIYfPQmXrlDB3I+uOgwQWjmvBecuGoetxjBcts0k3JjFuIXZnpJcX4ee
         hkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777118888; x=1777723688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jE1rlsOcAb8mtjkROW5TnXVBqCOL8sz1Ss/Eu8mtnWs=;
        b=aU/ykUL648PpnvazDjiHssPY5nIwFCPbq5kY0sxur06cWYLqIPro/WajLWwv01QjYL
         W+q4UM9siMjjs/t3RgjPEv6Q+LniiJtmCbtf67NeEuOnSU85ScB4Vhpiz5ZtmGCC3KMB
         J/sBt4ZHQYlNHEQOXEaI48ymU+DrZEFkGne5Cnouuwxq1Svenb6TTdQZt1WLYDNF9RWd
         E+JF9ZjQHTOjeBDLhdKRkdGmEiuE0SDlJpu1n4XNMf58FdG8O1LdRVfmXtz/kJluUSxu
         PgvIGg4osMmn0S3OI67TBGydht0ZwfOjqNrK2QCWsdpZ1xiXwjlX17cFoCIJl+cCY0oi
         2uKA==
X-Forwarded-Encrypted: i=1; AFNElJ/gjk1NpXGRboTsDi5loFhRPBpFDPMhHpTyp2hASd1yGQ760uXmC1sZvVE06t2D0BFcpXsFuCybpirH6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3M7YAoBb5hh3m1TO7aVYoh1pN4WoYS2n1DpBmr4StJUJr+hKe
	Z9RZqwOkAifJ7HGskq4ccAqHrVgnqWZSypSB067S/PoldmXlLTcxvD4xVFH7xibcTcL9MCyU8yU
	Ee67faE3exoXlkbSoKzihUwasrUvibrJvWViVOWoBRy9dsBWLXzxIUz4I2ZQx7Gzwxg==
X-Gm-Gg: AeBDieuDEWmqX0w83HArt+EQXWqNzWNfIQPMfKOXwrxG/6vFT209lfwQNY++hIqdS56
	pIcncdzLJcmRO3+S5zTdzM0e4k6bPnZbY2hSeFml08N0BOKQmfuNE5fGl/wOuj3XA7gIHcxMOHR
	0q8VcQ0OmGqKgMGB9ML59YMTyv68ZPoVW+c0NcUpnhdMk9OsQIlcxzAC6BY4X06IsuYB+8Fw1wb
	d79QNXQKEGsG2Iwvn8dpMOFMIzSzcgu6yJ55lvInKHPVF/I/v2FgvCkm1U4BazD9ar/Dz6Rs4cu
	mXt3mf6UcH1tscTTAUJAVnNipyFQbcSda0CGaU24+2cCPrRAOYkGh2He8vkBSt4LY8bTpXciFGK
	oFkDLKy6xBUNjkE4xd+gA11vK32MMgmoolkgpYan8zDPtGpsRNDSCdvBd47jyBXjfpndkctbFsz
	Uyx9TVNR9QWqd++KYmhqMJgC6vytUgAxdsrGM9PjJ9K6wzNg==
X-Received: by 2002:a05:6102:6c9:b0:611:3bcb:aee5 with SMTP id ada2fe7eead31-616f142e949mr18800611137.0.1777118887710;
        Sat, 25 Apr 2026 05:08:07 -0700 (PDT)
X-Received: by 2002:a05:6102:6c9:b0:611:3bcb:aee5 with SMTP id ada2fe7eead31-616f142e949mr18800598137.0.1777118887278;
        Sat, 25 Apr 2026 05:08:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f66besm57897581fa.13.2026.04.25.05.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 05:08:06 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:08:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/panel: Add atomic versions of panel ops
Message-ID: <fjrm77kea7efb3xpxsqajrki7uzlhvbtwfyjvgnhznt5pisjfj@tfkmlodkjpw6>
References: <20260425001130.233935-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260425001130.233935-1-val@packett.cool>
X-Proofpoint-GUID: Llsr_USBVQmr9E3mlIRsBhozxivOnQM9
X-Proofpoint-ORIG-GUID: Llsr_USBVQmr9E3mlIRsBhozxivOnQM9
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69ecaea8 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=9kKUQjWlHt89d_PKQGIA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDEyMSBTYWx0ZWRfX7fKtcZ5wO4NP
 TBG9YKEyOYRx0yadt1LRRYe6Z0fFA9RYOj3VYSc6rcvtKVviA/SQG9j+Wb32uudrusfIYKbsAM7
 2rR/i75Y0UIb0olC2zfFktuJ6S0mx6FG5QdGrodm0XXum/0xJh5FgjaO2ySYElrBgBF3SdAkoU0
 BJuv/SFHkHvoazrgz763tItG+n5W8QcbLg0Tu9xOaknedEZ544czJ3lzkJuySN/7JZBMW0pSt/f
 S8h8XskDf9pdFTvb/r01iTbYIn0B0rsqxJCBppTbq9Q8m9vgAgMh6tkKb8dS5CLde854jnXs0To
 YBG+58zBsZAa18uBKpWDbF3XbUJALnSJ1qFmu3BUwEQm0Nwem6Bl6AQFrxdw2XOL2anA/+uGAav
 c3km5D9eS+GfDjEtWPmE73E/bEXrmT9lSD+RlYGw3VQnXA3zrHTgJM7CsuHdDYNPqAo/RQf6GEr
 hY87IweBJIgMu1xXeag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250121

On Fri, Apr 24, 2026 at 08:49:50PM -0300, Val Packett wrote:
> Modern DSI panels support various modes (resolutions and refresh rates),
> which usually requires sending mode-specific DCS commands to configure the
> DDIC during operations like prepare(). However existing drm_panel_funcs
> only take the panel itself as an argument, so there's no way to access
> relevant state (such as the mode being set) inside of these functions.
> 
> To allow panel drivers access to the state, introduce new atomic_*
> versions of the prepare/enable/disable/unprepare ops, and make the
> corresponding drm_panel_* functions call them if available, falling back
> to the original ops otherwise. To avoid the need to modify all consumers
> at once, the original single-argument drm_panel_* functions are redefined
> as aliases to the new ones, passing NULLs for the new extra arguments.
> 
> The atomic ops pass the CRTC as well as the atomic state because getting
> the mode being set is part of per-CRTC state.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> 
> As discussed in my recent RFC [1] and an older thread I was pointed to
> there [2], the right way to expose the mode to panel drivers is to expose
> the entire atomic state and let them find the mode there. (Turns out,
> the drm_crtc must also be passed along with the state as it's necessary
> for drm_atomic_get_new_crtc_state).
> 
> Hopefully this first "real" attempt is close enough! :)
> 
> I have tested this with the WIP nt37701 driver from the linked RFC,
> only slightly updated to receive the new args and not directly the mode.
> 
> [1]: https://lore.kernel.org/all/20260412113851.355944-1-val@packett.cool/
> [2]: https://lore.kernel.org/dri-devel/nfc6ih43gjpi5u67fpkkxgwwygv53grdldq7tfp5iiukrkiy2u@53fsrtezzkyt/
> 
> Thanks,
> ~val
> 
> ---
>  drivers/gpu/drm/drm_panel.c |  88 +++++++++++++++--------
>  include/drm/drm_panel.h     | 137 ++++++++++++++++++++++++++++++++++--
>  2 files changed, 193 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index d1e6598ea3bc..48fce5e89bca 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -102,16 +102,20 @@ void drm_panel_remove(struct drm_panel *panel)
>  EXPORT_SYMBOL(drm_panel_remove);
>  
>  /**
> - * drm_panel_prepare - power on a panel
> + * drm_panel_atomic_prepare - power on a panel
>   * @panel: DRM panel
> + * @crtc: the CRTC used to drive the panel, may be NULL

What does NULL mean here? How would panel's atomic helpers behave if
they receive NULL?

If you want to see a nicer way to migrate to atomic funcs, see
5ade071ba13e ("drm: Add atomic variants for bridge enable/disable").

So, you can't replace drm_panel_foo() with a stub calling
drm_atomic_panel_foo().

> + * @state: current atomic commit state, may be NULL
>   *
>   * Calling this function will enable power and deassert any reset signals to
>   * the panel. After this has completed it is possible to communicate with any
>   * integrated circuitry via a command bus. This function cannot fail (as it is
>   * called from the pre_enable call chain). There will always be a call to
> - * drm_panel_disable() afterwards.
> + * drm_panel_atomic_disable() afterwards.
>   */
> -void drm_panel_prepare(struct drm_panel *panel)
> +void drm_panel_atomic_prepare(struct drm_panel *panel,
> +			      struct drm_crtc *crtc,

Thinking about it... We can have several panels being driven by the same
CRTC. Likewise there can be a lot going on between the CRTC and the
panel. After looking at the code actually calling drm_panel functions,
the only thing that we can easily pass here is the encoder. But then,
there also might be bridges between encoder and the panel. Encoders
don't have state per se.

If the panel needs to identify something, it should be getting the
connector. It might be a more cumbersome, but it sounds like a more
logical option here.

Maxime suggested passing drm_connector_state here instead of the
complete state + connector. I don't have a strong preference here, but I
think that the latter might be slighly more idiomatic nowadays.


> +			      struct drm_atomic_state *state)
>  {
>  	struct drm_panel_follower *follower;
>  	int ret;

[...]

> @@ -330,11 +384,86 @@ void drm_panel_put(struct drm_panel *panel);
>  void drm_panel_add(struct drm_panel *panel);
>  void drm_panel_remove(struct drm_panel *panel);
>  
> -void drm_panel_prepare(struct drm_panel *panel);
> -void drm_panel_unprepare(struct drm_panel *panel);
> +void drm_panel_atomic_prepare(struct drm_panel *panel,
> +			      struct drm_crtc *crtc,
> +			      struct drm_atomic_state *state);
>  
> -void drm_panel_enable(struct drm_panel *panel);
> -void drm_panel_disable(struct drm_panel *panel);
> +/**
> + * drm_panel_prepare - power on a panel
> + * @panel: DRM panel
> + *
> + * Calling this function will enable power and deassert any reset signals to
> + * the panel. After this has completed it is possible to communicate with any
> + * integrated circuitry via a command bus. This function cannot fail (as it is
> + * called from the pre_enable call chain). There will always be a call to
> + * drm_panel_disable() afterwards.
> + *
> + * If atomic commit state is available, call drm_panel_atomic_prepare instead.
> + */
> +static inline void drm_panel_prepare(struct drm_panel *panel)
> +{
> +	drm_panel_atomic_prepare(panel, NULL, NULL);
> +}
> +
> +void drm_panel_atomic_unprepare(struct drm_panel *panel,
> +				struct drm_crtc *crtc,
> +				struct drm_atomic_state *state);
> +
> +/**
> + * drm_panel_unprepare - power off a panel
> + * @panel: DRM panel
> + *
> + * Calling this function will completely power off a panel (assert the panel's
> + * reset, turn off power supplies, ...). After this function has completed, it
> + * is usually no longer possible to communicate with the panel until another
> + * call to drm_panel_prepare().
> + *
> + * If atomic commit state is available, call drm_panel_atomic_unprepare instead.
> + */
> +static inline void drm_panel_unprepare(struct drm_panel *panel)
> +{
> +	drm_panel_atomic_unprepare(panel, NULL, NULL);
> +}
> +
> +void drm_panel_atomic_enable(struct drm_panel *panel,
> +			     struct drm_crtc *crtc,
> +			     struct drm_atomic_state *state);
> +
> +/**
> + * drm_panel_enable - enable a panel
> + * @panel: DRM panel
> + *
> + * Calling this function will cause the panel display drivers to be turned on
> + * and the backlight to be enabled. Content will be visible on screen after
> + * this call completes. This function cannot fail (as it is called from the
> + * enable call chain). There will always be a call to drm_panel_disable()
> + * afterwards.
> + *
> + * If atomic commit state is available, call drm_panel_atomic_enable instead.
> + */
> +static inline void drm_panel_enable(struct drm_panel *panel)
> +{
> +	drm_panel_atomic_enable(panel, NULL, NULL);
> +}
> +
> +void drm_panel_atomic_disable(struct drm_panel *panel,
> +			      struct drm_crtc *crtc,
> +			      struct drm_atomic_state *state);
> +
> +/**
> + * drm_panel_disable - disable a panel
> + * @panel: DRM panel
> + *
> + * This will typically turn off the panel's backlight or disable the display
> + * drivers. For smart panels it should still be possible to communicate with
> + * the integrated circuitry via any command bus after this call.
> + *
> + * If atomic commit state is available, call drm_panel_atomic_disable instead.
> + */
> +static inline void drm_panel_disable(struct drm_panel *panel)
> +{
> +	drm_panel_atomic_disable(panel, NULL, NULL);
> +}
>  
>  int drm_panel_get_modes(struct drm_panel *panel, struct drm_connector *connector);
>  
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
