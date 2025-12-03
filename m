Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD351EF0B9;
	Wed,  3 Dec 2025 21:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764797807; cv=none; b=tMCxnwWba//c3AVc8HPykfQea1AqvKRYzpqeJyWCUQCwLZ2sxSb55e4ebJMpxk5ZnMpvhhNzj+jJRnjKJsF7s9tuAjZsNgn2RDcYHV31adpddoWpZMdCFetR/X+bdW/kFN1hH3IF5CFfuKd9F38l78MlpIcARYj98KuyVC1pr34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764797807; c=relaxed/simple;
	bh=xi/UE7eH73SnziD0zbrkwRHfTouzpE9xDZlzHV/IjIk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Tu5Y6jPC9kmpxpJQZb7NzSe+IAKsRZD+R19Z5hGGhJ+O+Rt0FsNHGDyANfZfJymwvykn/IeyFnf2JkBw7Iaj3plsVbeKhrU3ssBhUIK7pWUKZ/IUT8/Wk88nf+Ez9HRD0jfNQH2x3WwioARcyUm7AvWjbf1ryfwZC+rSKwW7qIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=YkImt/6a; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OUgCPp1R; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="YkImt/6a";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OUgCPp1R"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 80DEBEC054F;
	Wed,  3 Dec 2025 16:36:43 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Wed, 03 Dec 2025 16:36:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1764797803;
	 x=1764884203; bh=p9lTMYDmodUemRlYAdaS4dCGJxUgupIoyMEg8F5xbEs=; b=
	YkImt/6aj7kgIW/h1XCWc9w8I+DUTTLe5wKrBTmmIA36YonIkhFBVvTEuQg94BZb
	iYhjkncz4byILGyjCVl1KxT8fsDT3MtCBt+9eSgrijZdS6D3oNmXcSaLC56peWSY
	3rxYgJlbD4b91ND4h3jlYOxL5oFaZAgkE+RdPDdMn/glmzImHpv4/ix37TCsFcQY
	NvkTpVd3RjNottIZXIdQN5FlOxYbQE8SKiWicsLP8gEYMBqGmRca155mcxC7bVOr
	k30Ec56Gd95OoyX5QwXRX3kWl23dAumqwrhLJdoe7Gxmnh2YFx0RuJH2V4c9CVIX
	loibyoICmvLYQv2DqRqElA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764797803; x=
	1764884203; bh=p9lTMYDmodUemRlYAdaS4dCGJxUgupIoyMEg8F5xbEs=; b=O
	UgCPp1R3uVH6wfejQhFW9vVOXpSWzpVaU5kTDRODvg/e65S36ouOxPPSuikoeBmH
	3ukO8JSn7BcfrJETnF653zhXb7bgLiSlmeQ117VLQfNtHMTpefAhT4q/fGWouzRq
	+GpiEX+bjFQmjp89wp04QD/j+tf1d2JdKrqWXLXGg+fyzb/2L/kUHB0M8dafL2bq
	UXqQpWMZjg1f+lLFlJR5q9nTEzQfX7YVxiQ/HRnxxK2T7gYDKceKpldlVfsoVA6u
	A9bgAR/Qx1N82u39wCYpztlvXcHvscvO2H0yLt6xPzEZSzFxt9rm6A4d/Hivb8pV
	zUDAbc34SZImz9ofw1D3w==
X-ME-Sender: <xms:aq0wacdxE6rNVTHZHjCuf7axTvY6qwk8dP8GopPY1XfG8CZJc3h1Ig>
    <xme:aq0waZAPgzO35GjZNe3vReySmC2WCsnWCrHzIGmZAWQLs1691BB3EWBIkiX7eI_U1
    T4qvy_kU2nyC5cOCs97jadZN_kiL917fnTsVjFcODQI0YF8RuHbZ4ic>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    ephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
    grrhhnuggsrdguvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpth
    htoheptggrshgvhiestghonhhnohhllhihrdhtvggthhdprhgtphhtthhopegushgrnhhk
    ohhushhkihesghhmrghilhdrtghomhdprhgtphhtthhopegrsghlohgtohhrrhgvrgeshh
    hothhmrghilhdrtghomhdprhgtphhtthhopegurghvihgusehigihithdrtgiipdhrtghp
    thhtohepfhhoshhssehjohgvlhhsvghlvhgrrhgrjhdrtghomhdprhgtphhtthhopeifih
    hllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptggrshgvhidrtghonhhnohhllhih
    sehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlh
    eslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:aq0waRuBkjYsDyNpbaaiYFc3BFIsLtby1Kuyv4M51BycliqDeyejLw>
    <xmx:aq0waeItCelB2KjXyrIhYIAhi-BB25O8kc0Vd5JeVTrIjGgmoPM__A>
    <xmx:aq0wadbi8IcDgGg_LHhgQSO9MxxgnLNv6K8LZjtsGj3r0wK2Fmi2pA>
    <xmx:aq0waZkgJS_QATH3NrcsOhdlue5Qne8wt05F8wcSANzwPPaAL3p35A>
    <xmx:a60waZuM6QuDiAWXKtU3gG6VMYLYY8xzZSdrWcNTTLmLJ-4mHaY126yp>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B1EF8C40054; Wed,  3 Dec 2025 16:36:42 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 03 Dec 2025 22:35:36 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: david@ixit.cz, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>,
 "Casey Connolly" <casey.connolly@linaro.org>,
 "Casey Connolly" <casey@connolly.tech>,
 "Joel Selvaraj" <foss@joelselvaraj.com>,
 "Alexander Martinz" <amartinz@shiftphones.com>,
 "Dzmitry Sankouski" <dsankouski@gmail.com>,
 =?UTF-8?Q?Pablo_Correa_G=C3=B3mez?= <ablocorrea@hotmail.com>
Cc: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
Message-Id: <8f8baac8-3b1a-442d-a64f-5a90f9e30552@app.fastmail.com>
In-Reply-To: <20251126-sdm845-config-question-v1-1-ffa91ed53095@ixit.cz>
References: <20251126-sdm845-config-question-v1-1-ffa91ed53095@ixit.cz>
Subject: Re: [PATCH QUESTION] arm64: configs: Add Snapdragon 845 config fragment
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 26, 2025, at 17:19, David Heidelberg via B4 Relay wrote:
>
> This patch is a question, if it would be viable to introduce this
> configuration fragment as part of mainline kernel, so keeping it in sync
> with recent kernel updates would be more straighforward.

I don't mind the idea of having additional fragments for specific
purposes, but as others have said this one does not seem that useful.

I think it does too many things at once and is still too specific to
a relatively uncommon usecase. Having an SDM845 specific fragment is
clearly too narrow, but I can see us adding a fragment for phones
overall, which would then turn on options for Qualcomm, Mediatek
and Samsung based phones.

> +# Samsung S9 SM-G9600(starqltechn)
> +CONFIG_SND_SOC_MAX98512=y
> +CONFIG_SND_SOC_MAXIM_DSM=y
> +CONFIG_SND_SOC_MAXIM_DSM_CAL=y
> +CONFIG_DRM_PANEL_SAMSUNG_S6E3HA8=y
> +CONFIG_TOUCHSCREEN_S6SY761=m
> +CONFIG_MFD_SEC_CORE=m
> +CONFIG_REGULATOR_S2DOS05=m
> +CONFIG_MFD_MAX77705=m
> +CONFIG_LEDS_MAX77705=m
> +CONFIG_CHARGER_MAX77705=m
> +CONFIG_BATTERY_MAX17042=m
> +CONFIG_INPUT_MAX77693_HAPTIC=m
> +CONFIG_PWM_CLK=m
> +
> +# SHIFT6mq
> +CONFIG_DRM_PANEL_VISIONOX_RM69299=y
> +CONFIG_SND_SOC_TFA989X=m

I think overall we can be fairly liberal with adding
more loadable modules to the common defconfig, but much
less so the built-in drivers.

> +# SOC
> +CONFIG_FORCE_NR_CPUS=y
> +CONFIG_NR_CPUS=8

This would break other devices that have more CPUs, which in turn
makes it impossible to combine the fragment with other fragments.

> +CONFIG_SCSI_UFS_QCOM=y
> +CONFIG_QCOM_GSBI=y
> +CONFIG_QCOM_LLCC=y
> +CONFIG_QCOM_OCMEM=y
> +CONFIG_QCOM_RMTFS_MEM=y
> +CONFIG_QCOM_SOCINFO=y
> +CONFIG_QCOM_WCNSS_CTRL=y
> +CONFIG_QCOM_APR=y
> +CONFIG_POWER_RESET_QCOM_PON=y
> +CONFIG_QCOM_SPMI_TEMP_ALARM=y
> +CONFIG_QCOM_LMH=y
> +CONFIG_SCHED_CLUSTER=y
> +CONFIG_SND_SOC_QDSP6_Q6VOICE=m
> +CONFIG_SCSI_UFS_BSG=y
> +CONFIG_PHY_QCOM_QMP_PCIE=y
> +CONFIG_BACKLIGHT_CLASS_DEVICE=y
> +CONFIG_INTERCONNECT_QCOM_OSM_L3=y

Again, these should mosely be loadable modules.

> +# Notification LED
> +# Must be builtin as it won't be automatically modprobed
> +CONFIG_LEDS_TRIGGER_PATTERN=y

This sounds like bug that we should fix and not work around.

> +# Graphics
> +CONFIG_DRM=y
> +CONFIG_FB_SIMPLE=y

I don't want to enable more fbdev drivers. Right now the
only one we enable is FB_EFI, and we should probably replace
that with DRM_SIMPLEDRM in order to turn off CONFIG_FB
entirely.

> +# Power management
> +CONFIG_PM_AUTOSLEEP=y
> +CONFIG_PM_WAKELOCKS=y
> +
> +# MGLRU
> +CONFIG_LRU_GEN=y
> +CONFIG_LRU_GEN_ENABLED=y
> +
> +# Usage clamping (scale CPU for specific tasks)
> +CONFIG_UCLAMP_TASK=y
> +CONFIG_UCLAMP_TASK_GROUP=y

We can discuss changing the defaults for these in the defconfig,
but this doesn't seem to belong with the other stuff.

> +# HID/Input
> +CONFIG_LCD_CLASS_DEVICE=m

This is not an input option

> +CONFIG_I2C_HID=y
> +CONFIG_HID_GENERIC=m
> +CONFIG_UHID=m
> +CONFIG_USB_HID=m
> +CONFIG_INPUT_EVDEV=y
> +CONFIG_BT_HIDP=m
> +CONFIG_INPUT_JOYDEV=m
> +CONFIG_HID_ACCUTOUCH=m
> +CONFIG_HID_ACRUX=m
> +CONFIG_HID_ACRUX_FF=y
> +CONFIG_HID_ALPS=m
> +CONFIG_HID_APPLEIR=m

This looks like you are just enabling every single USB HID 
driver, which is probably not something we want in a commonly
used fragment, though having a well-maintained fragment for
popular pluggable USB devices may be useful for others as well.

> +# Qcom stuff
> +CONFIG_RPMSG_CHAR=y
> +CONFIG_QCOM_Q6V5_ADSP=m
> +CONFIG_BT_RFCOMM=m
> +CONFIG_BT_RFCOMM_TTY=y
> +CONFIG_BT_BNEP=m
> +CONFIG_BT_BNEP_MC_FILTER=y
> +CONFIG_BT_BNEP_PROTO_FILTER=y
> +CONFIG_BT_HS=y
> +CONFIG_BT_LE=y
> +CONFIG_HID_BATTERY_STRENGTH=y
> +CONFIG_HIDRAW=y
> +CONFIG_QCOM_COINCELL=m
> +CONFIG_QCOM_FASTRPC=m
> +CONFIG_QCOM_SPMI_VADC=y
> +CONFIG_QCOM_SPMI_ADC5=y
> +CONFIG_PHY_QCOM_QMP=y
> +CONFIG_PHY_QCOM_QUSB2=y
> +CONFIG_PHY_QCOM_QMP_UFS=y
> +CONFIG_TYPEC=y
> +CONFIG_PHY_QCOM_QMP_COMBO=y
> +CONFIG_LEDS_CLASS_FLASH=y
> +CONFIG_TCP_CONG_ADVANCED=y
> +CONFIG_TCP_CONG_WESTWOOD=y
> +CONFIG_DEFAULT_WESTWOOD=y
> +CONFIG_BLK_DEV_RAM=y
> +CONFIG_BLK_DEV_RAM_SIZE=8192
> +CONFIG_BTRFS_FS=y
> +CONFIG_BTRFS_FS_POSIX_ACL=y
> +CONFIG_F2FS_FS=y

Most of these don't look like "Qcom stuff" to me. In particular
BTRFS is probably not something you'd even want to enable on
a phone, though that could be part of a generic distro config
that we have discussed several times in the past.

> +# WLAN debugging
> +CONFIG_ATH10K_DEBUG=y
> +CONFIG_ATH10K_DEBUGFS=y
> +CONFIG_ATH10K_SPECTRAL=y

This particular one seem arbitrary, but having a "debugging"
fragment is something others may find helpful as well. The
hard part there is figuring out which debug options are the
most helpful for the least overhead, as everyone is debugging
different bugs.

> +# Disable all unrelated stuffs afaik
> +CONFIG_ARCH_BLAIZE=n
> +CONFIG_ARCH_SPARX5=n
> +CONFIG_HIBERNATION=n
> +CONFIG_FW_LOADER_USER_HELPER=n
> +CONFIG_FW_LOADER_USER_HELPER_FALLBACK=n
> +CONFIG_BLK_DEV_NVME=n

It feels wrong to turn things off in the same fragment
that turns other things on.

      Arnd
