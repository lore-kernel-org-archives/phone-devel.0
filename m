Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798525B697
	for <phone-devel@vger.kernel.org>; Thu, 29 Feb 2024 09:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709198859; cv=none; b=XKaT/DzRFvNPsk5pFzJZZdMdjXXJ6F3Sn17liJBvzGOBnNWOmVXvI2Uz9A+NeZ/KS8MMwvC+eqlKp8JfCHM5v+Ip20v/Auu2Hxdx51VH0MBwn7XB1eXkKIX/CO5Mjg72N2+o4FotYdyFednF5ICctVgkdpBCdsaQGh6ISHGz4Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709198859; c=relaxed/simple;
	bh=Bt+6HUNU4JLltfZpincMFjh+g0KSkoZR27N1mCOMTAo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=a0kMdbr6O2SJwgzH25oplooblwAFnmAGnwVZu7WkLiFh4ZRI207sToSWJPDMgWaVbYv3vyu8WhNqi78q9fe85M3FZnCho+unROLeKB6X029z0ve/XtwHCjOPQrF75Ee/hMrNO3lvFtEjDkL98uyNEVzbUCbudkKzzTUIXhJfB9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=0ABp3sjm; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="0ABp3sjm"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-563c403719cso985375a12.2
        for <phone-devel@vger.kernel.org>; Thu, 29 Feb 2024 01:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1709198854; x=1709803654; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1n6ZCV67cur8e5mAju//0gzCRgXTlxNt1OqrWENqIVs=;
        b=0ABp3sjm5vzBfsOuhTPARKgb2GE8mw/9VtWUqPSGEMPHGlKHzx/pjscvcHWJzfjONH
         DIwCKPUjfKasi9JjrTJ//n+BJBLFT/GEEfXgox0I1J91iUDNTtIOkqJZDcorZW9zcWK1
         JfNGtXPLyPzrGHcg5oPPL4lZ6rW8ExHwzLy6TUf0GE24Shd6kNYcCEqsmgnw6+DUdAnX
         QVS98YmFQHxwzOwhJjjyThw4ac29/I1rURzv0tp4CVRIJvTUWNm6WNgkAqZQqyf8rZ0v
         sO32jQsM3zpg68DBey53lPGGMxvFxmZjUk9/MLcpqxDx1zTo31fO0F7tBah1q5d4H+uL
         uw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709198854; x=1709803654;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1n6ZCV67cur8e5mAju//0gzCRgXTlxNt1OqrWENqIVs=;
        b=uFoHzjomax1nev9T3WuJImnEKMaOg4prRaVF/UgtRxIjoFZql5RiIqwUqitBP5GEVg
         skM/WA57EzjLTMiF4WFOsZzuV7auFeWWm3QZXSlMFsjznKhYmSQ3XCuN79SgAocmDows
         zpGy928rQTvMYP5qguyZrWzBIYAamf1jCYAvPHRDNSdzGYnxVpy7BGZe68G/nAxYzlwS
         9h91dFgFXO03kbQlfBOuS1EIk9hcMGbQxeRJfACI4OAhZUa4UW8rYwYdaAXiLb0eES6V
         olcGRZs5Nmy1828tuh7TuEelFvTc7quecwRPJsu6ySwn+SPaaRl7QZQ1kmyR2x1q6LNJ
         kgjg==
X-Forwarded-Encrypted: i=1; AJvYcCVFzp2JoifcEuhFBgqZPNgl6T81ZoK7ToYF/iAPwglXpxdt1ZmM6cY7HbARV9bT6K7aKdBxRtNgGCDVsUEV2P/nyZRt4v761K2J5Ac=
X-Gm-Message-State: AOJu0Yyed4M1N/lHp0/+yuAqmQbDFgZD4Y0mxTWtXAmnMJ5ofR816XN/
	6ylKI8LOad//hTOQQC1ECwK1g2MAiLZhrDfCi2+GXYHecj8ERp1WKxwCdXUQA4FgIiMsG3IHsD6
	r
X-Google-Smtp-Source: AGHT+IHQg7Xq8XAUxZCM3b/8E8wHu/qSRHC8mHdsKWekvtDdWPMBzGdgTylK0ht1WUfnSdjcGfBQAQ==
X-Received: by 2002:a05:6402:520c:b0:565:b4ca:72f3 with SMTP id s12-20020a056402520c00b00565b4ca72f3mr1476269edd.35.1709198853784;
        Thu, 29 Feb 2024 01:27:33 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id c6-20020a056402100600b0056536eed484sm436406edu.35.2024.02.29.01.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 01:27:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Feb 2024 10:27:32 +0100
Message-Id: <CZHGFD9QYM82.371U2DPG1AEGQ@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, <neil.armstrong@linaro.org>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>
X-Mailer: aerc 0.15.2
References: <20240111-drm-panel-bridge-fixup-v1-1-e06292f6f500@fairphone.com> <b1da07f9-7e15-4d83-bef3-d0ce157654bc@linaro.org> <CYGUWBAM3D62.35CPP5HGEYJ3Y@fairphone.com>
In-Reply-To: <CYGUWBAM3D62.35CPP5HGEYJ3Y@fairphone.com>

On Wed Jan 17, 2024 at 9:59 AM CET, Luca Weiss wrote:
> On Mon Jan 15, 2024 at 9:43 AM CET, Neil Armstrong wrote:
> > Hi Luca,
> >
> > On 11/01/2024 13:38, Luca Weiss wrote:
> > > Since the kconfig symbol of DRM_PANEL_BRIDGE is only adding
> > > bridge/panel.o to drm_kms_helper object, we need to select
> > > DRM_KMS_HELPER to make sure the file is actually getting built.
> > >=20
> > > Otherwise with certain defconfigs e.g. devm_drm_of_get_bridge will no=
t
> > > be properly available:
> > >=20
> > >    aarch64-linux-gnu-ld: drivers/phy/qualcomm/phy-qcom-qmp-combo.o: i=
n function `qmp_combo_bridge_attach':
> > >    drivers/phy/qualcomm/phy-qcom-qmp-combo.c:3204:(.text+0x8f4): unde=
fined reference to `devm_drm_of_get_bridge'
> > >=20
> > > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > > ---
> > > I can see "depends on DRM_KMS_HELPER" was removed with commit
> > > 3c3384050d68 ("drm: Don't make DRM_PANEL_BRIDGE dependent on DRM_KMS_=
HELPERS")
> > >=20
> > > I'm not too familiar with Kconfig but it feels more correct if
> > > PHY_QCOM_QMP_COMBO selects DRM_PANEL_BRIDGE that that's enough; and i=
t
> > > doesn't also has to explicitly select DRM_KMS_HELPER because of how t=
he
> > > objects are built in the Makefile.
> > >=20
> > > Alternatively solution to this patch could be adjusting this line in
> > > include/drm/drm_bridge.h:
> > >=20
> > >    -#if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL_BRIDGE)
> > >    +#if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL_BRIDGE) && def=
ined(CONFIG_DRM_KMS_HELPER)
> > >     struct drm_bridge *devm_drm_of_get_bridge(struct device *dev, str=
uct device_node *node,
> > >                                              u32 port, u32 endpoint);
> > >=20
> > > .. and then selecting DRM_KMS_HELPER for PHY_QCOM_QMP_COMBO.
> > >=20
> > > But I think the solution in this patch is better. Let me know what yo=
u
> > > think.
> >
> > I think this is no more the case after on linux-next:
> > 35921910bbd0 phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
> >
> > But could you still check ?
>
> On next-20240117 the error happens in the aux-bridge file instead then.
>
> aarch64-linux-gnu-ld: drivers/gpu/drm/bridge/aux-bridge.o: in function `d=
rm_aux_bridge_probe':
> drivers/gpu/drm/bridge/aux-bridge.c:115:(.text+0xe0): undefined reference=
 to `devm_drm_of_get_bridge'
>
> I'm attaching the defconfig with which I can reproduce this but it's
> really just DRM_KMS_HELPER=3Dn and PHY_QCOM_QMP_COMBO=3Dy I believe.

Hi Neil,

Ping on this patch

Regards
Luca

>
> Regards
> Luca
>
>
> >
> > Neil
> >
> > > ---
> > >   drivers/gpu/drm/bridge/Kconfig | 1 +
> > >   1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/=
Kconfig
> > > index ac9ec5073619..ae782b427829 100644
> > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > @@ -8,6 +8,7 @@ config DRM_BRIDGE
> > >   config DRM_PANEL_BRIDGE
> > >   	def_bool y
> > >   	depends on DRM_BRIDGE
> > > +	select DRM_KMS_HELPER
> > >   	select DRM_PANEL
> > >   	help
> > >   	  DRM bridge wrapper of DRM panels
> > >=20
> > > ---
> > > base-commit: b9c3a1fa6fb324e691a03cf124b79f4842e65d76
> > > change-id: 20240111-drm-panel-bridge-fixup-5c2977fb969f
> > >=20
> > > Best regards,

