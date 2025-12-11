Received: from ixit.cz (ip-94-112-25-9.bb.vodafone.cz [94.112.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EC419C54F;
	Thu, 11 Dec 2025 10:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.112.25.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765449690; cv=none; b=cX1sYEqyNjVP+E4VQ7lgtw8TsMzMZCGfF4J9roRFsfI7BwaZ2ec537UHfYa1iF7Pmo/ReXex2SCPAUZQ7lwliY8jE4hVDh05XrfqWzNsw2+dnokyIXdnjXLpW4cqfFCEiU9G3MADpPmYJ3CEarFFiPI3tXpljYPr8ZSGApFnPng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765449690; c=relaxed/simple;
	bh=begFGZazqUKZQa9ofKLMdCkCaBySGSED/jRTMP9SLBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XxTJY+La/C2h0gn4dbE/j8CsXLGNZIKOC19hn1IXaGcRKPvuVzHcGcaZbBaCHhCUqlJYO4f6AbzS3JUd901K17LrN9Ou4/zLpAWboB1m5rPE+KSFlNGDsiKifODPBvPbImssrFSYKkl10sOuQu+uErxL4TT2iF/15WzH7YMCUB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=PQ/cUp0C; arc=none smtp.client-ip=94.112.25.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="PQ/cUp0C"
Received: from [10.0.0.200] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id C2ACF53400DF;
	Thu, 11 Dec 2025 11:41:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1765449680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=39t4qSwaXVVCQNrcHAVK1TaW9IJtAMG+tTL2a2iNL60=;
	b=PQ/cUp0C6KYobnnWtTIQ50KvBYR45B9+qLoCTtcPQTfIvDBhEYl8Ru128pbqqZlEReg5M4
	iboNwi0BzxVAbsQfbBOhZOiMF2UnbbzpM2RAuRt3mAQatwxXhfUG0eq8Yxo408XT1XC+5X
	dlH6DmcpYuQBb1Q9OTYgeAI/as5XMug=
Message-ID: <9221ccef-f1b9-4491-83e2-7116b7523857@ixit.cz>
Date: Thu, 11 Dec 2025 11:41:20 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH QUESTION] arm64: configs: Add Snapdragon 845 config
 fragment
To: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Casey Connolly <casey.connolly@linaro.org>,
 Casey Connolly <casey@connolly.tech>, Joel Selvaraj <foss@joelselvaraj.com>,
 Alexander Martinz <amartinz@shiftphones.com>,
 Dzmitry Sankouski <dsankouski@gmail.com>,
 =?UTF-8?Q?Pablo_Correa_G=C3=B3mez?= <ablocorrea@hotmail.com>
Cc: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251126-sdm845-config-question-v1-1-ffa91ed53095@ixit.cz>
 <8f8baac8-3b1a-442d-a64f-5a90f9e30552@app.fastmail.com>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <8f8baac8-3b1a-442d-a64f-5a90f9e30552@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/12/2025 22:35, Arnd Bergmann wrote:
> On Wed, Nov 26, 2025, at 17:19, David Heidelberg via B4 Relay wrote:
>>
>> This patch is a question, if it would be viable to introduce this
>> configuration fragment as part of mainline kernel, so keeping it in sync
>> with recent kernel updates would be more straighforward.
> 
> I don't mind the idea of having additional fragments for specific
> purposes, but as others have said this one does not seem that useful.
> 
> I think it does too many things at once and is still too specific to
> a relatively uncommon usecase. Having an SDM845 specific fragment is
> clearly too narrow, but I can see us adding a fragment for phones
> overall, which would then turn on options for Qualcomm, Mediatek
> and Samsung based phones.

I agree there are too specific things. I sent this as a conversation 
starter more than "a fragment to ship".

Having something like a pure mobile fragment would be awesome.
Bringing up phones is challenging enough, so when people have one more 
pillar to rely on, it'll definitely accelerate work.

I believe it would help many close-to-mainline projects to have a more 
stable base in the kernel instead of every repository playing on own 
small playground.

> 
>> +# Samsung S9 SM-G9600(starqltechn)
>> +CONFIG_SND_SOC_MAX98512=y
>> +CONFIG_SND_SOC_MAXIM_DSM=y
>> +CONFIG_SND_SOC_MAXIM_DSM_CAL=y
>> +CONFIG_DRM_PANEL_SAMSUNG_S6E3HA8=y
>> +CONFIG_TOUCHSCREEN_S6SY761=m
>> +CONFIG_MFD_SEC_CORE=m
>> +CONFIG_REGULATOR_S2DOS05=m
>> +CONFIG_MFD_MAX77705=m
>> +CONFIG_LEDS_MAX77705=m
>> +CONFIG_CHARGER_MAX77705=m
>> +CONFIG_BATTERY_MAX17042=m
>> +CONFIG_INPUT_MAX77693_HAPTIC=m
>> +CONFIG_PWM_CLK=m
>> +
>> +# SHIFT6mq
>> +CONFIG_DRM_PANEL_VISIONOX_RM69299=y
>> +CONFIG_SND_SOC_TFA989X=m
> 
> I think overall we can be fairly liberal with adding
> more loadable modules to the common defconfig, but much
> less so the built-in drivers.
> 
>> +# SOC
>> +CONFIG_FORCE_NR_CPUS=y
>> +CONFIG_NR_CPUS=8
> 
> This would break other devices that have more CPUs, which in turn
> makes it impossible to combine the fragment with other fragments.

Yes, I just used the original data from the fragment, as we know it's 8 
cores, it's safe option. For the final fragment this will go away (if we 
talk about mobile generic fragment).

> 
>> +CONFIG_SCSI_UFS_QCOM=y
>> +CONFIG_QCOM_GSBI=y
>> +CONFIG_QCOM_LLCC=y
>> +CONFIG_QCOM_OCMEM=y
>> +CONFIG_QCOM_RMTFS_MEM=y
>> +CONFIG_QCOM_SOCINFO=y
>> +CONFIG_QCOM_WCNSS_CTRL=y
>> +CONFIG_QCOM_APR=y
>> +CONFIG_POWER_RESET_QCOM_PON=y
>> +CONFIG_QCOM_SPMI_TEMP_ALARM=y
>> +CONFIG_QCOM_LMH=y
>> +CONFIG_SCHED_CLUSTER=y
>> +CONFIG_SND_SOC_QDSP6_Q6VOICE=m
>> +CONFIG_SCSI_UFS_BSG=y
>> +CONFIG_PHY_QCOM_QMP_PCIE=y
>> +CONFIG_BACKLIGHT_CLASS_DEVICE=y
>> +CONFIG_INTERCONNECT_QCOM_OSM_L3=y
> 
> Again, these should mosely be loadable modules.

Probably, some of these workarounds are here because of some issue in 
the kernel, which leads to boot failure.

There will be more of these bug-avoid changes.

We'll test how many of these are necessary.

The question is, if documented, could we push some of these into the 
initial fragments? I assume fixing some of these may take some time.

> 
>> +# Notification LED
>> +# Must be builtin as it won't be automatically modprobed
>> +CONFIG_LEDS_TRIGGER_PATTERN=y
> 
> This sounds like bug that we should fix and not work around.
> 
>> +# Graphics
>> +CONFIG_DRM=y
>> +CONFIG_FB_SIMPLE=y
> 
> I don't want to enable more fbdev drivers. Right now the
> only one we enable is FB_EFI, and we should probably replace
> that with DRM_SIMPLEDRM in order to turn off CONFIG_FB
> entirely.

Useful with debugging, but this can handle Mobian, NixOS Mobile, pmOS by 
their fragments, so that's fine to drop.

> 
>> +# Power management
>> +CONFIG_PM_AUTOSLEEP=y
>> +CONFIG_PM_WAKELOCKS=y
>> +
>> +# MGLRU
>> +CONFIG_LRU_GEN=y
>> +CONFIG_LRU_GEN_ENABLED=y
>> +
>> +# Usage clamping (scale CPU for specific tasks)
>> +CONFIG_UCLAMP_TASK=y
>> +CONFIG_UCLAMP_TASK_GROUP=y
> 
> We can discuss changing the defaults for these in the defconfig,
> but this doesn't seem to belong with the other stuff.

Great :)

> 
>> +# HID/Input
>> +CONFIG_LCD_CLASS_DEVICE=m
> 
> This is not an input option

Thanks, removed.

> 
>> +CONFIG_I2C_HID=y
>> +CONFIG_HID_GENERIC=m
>> +CONFIG_UHID=m
>> +CONFIG_USB_HID=m
>> +CONFIG_INPUT_EVDEV=y
>> +CONFIG_BT_HIDP=m
>> +CONFIG_INPUT_JOYDEV=m
>> +CONFIG_HID_ACCUTOUCH=m
>> +CONFIG_HID_ACRUX=m
>> +CONFIG_HID_ACRUX_FF=y
>> +CONFIG_HID_ALPS=m
>> +CONFIG_HID_APPLEIR=m
> 
> This looks like you are just enabling every single USB HID
> driver, which is probably not something we want in a commonly
> used fragment, though having a well-maintained fragment for
> popular pluggable USB devices may be useful for others as well.

Yeah, this part make sense for distro-specific.

> 
>> +# Qcom stuff
>> +CONFIG_RPMSG_CHAR=y
>> +CONFIG_QCOM_Q6V5_ADSP=m
>> +CONFIG_BT_RFCOMM=m
>> +CONFIG_BT_RFCOMM_TTY=y
>> +CONFIG_BT_BNEP=m
>> +CONFIG_BT_BNEP_MC_FILTER=y
>> +CONFIG_BT_BNEP_PROTO_FILTER=y
>> +CONFIG_BT_HS=y
>> +CONFIG_BT_LE=y
>> +CONFIG_HID_BATTERY_STRENGTH=y
>> +CONFIG_HIDRAW=y
>> +CONFIG_QCOM_COINCELL=m
>> +CONFIG_QCOM_FASTRPC=m
>> +CONFIG_QCOM_SPMI_VADC=y
>> +CONFIG_QCOM_SPMI_ADC5=y
>> +CONFIG_PHY_QCOM_QMP=y
>> +CONFIG_PHY_QCOM_QUSB2=y
>> +CONFIG_PHY_QCOM_QMP_UFS=y
>> +CONFIG_TYPEC=y
>> +CONFIG_PHY_QCOM_QMP_COMBO=y
>> +CONFIG_LEDS_CLASS_FLASH=y
>> +CONFIG_TCP_CONG_ADVANCED=y
>> +CONFIG_TCP_CONG_WESTWOOD=y
>> +CONFIG_DEFAULT_WESTWOOD=y
>> +CONFIG_BLK_DEV_RAM=y
>> +CONFIG_BLK_DEV_RAM_SIZE=8192
>> +CONFIG_BTRFS_FS=y
>> +CONFIG_BTRFS_FS_POSIX_ACL=y
>> +CONFIG_F2FS_FS=y
> 
> Most of these don't look like "Qcom stuff" to me. In particular
> BTRFS is probably not something you'd even want to enable on
> a phone, though that could be part of a generic distro config
> that we have discussed several times in the past.

Yeah, pmOS specific changes will be dropped.

> 
>> +# WLAN debugging
>> +CONFIG_ATH10K_DEBUG=y
>> +CONFIG_ATH10K_DEBUGFS=y
>> +CONFIG_ATH10K_SPECTRAL=y
> 
> This particular one seem arbitrary, but having a "debugging"
> fragment is something others may find helpful as well. The
> hard part there is figuring out which debug options are the
> most helpful for the least overhead, as everyone is debugging
> different bugs.

I was thinking having "fragment pack" for "early bringup-er", something 
like common things you need to verify, when you setting up
  - regulators
  - clocks
  - serial
  - framebuffer

When people are new to the kernel development and still don't know all, 
I think this may accelerate their progress.


> 
>> +# Disable all unrelated stuffs afaik
>> +CONFIG_ARCH_BLAIZE=n
>> +CONFIG_ARCH_SPARX5=n
>> +CONFIG_HIBERNATION=n
>> +CONFIG_FW_LOADER_USER_HELPER=n
>> +CONFIG_FW_LOADER_USER_HELPER_FALLBACK=n
>> +CONFIG_BLK_DEV_NVME=n
> 
> It feels wrong to turn things off in the same fragment
> that turns other things on.

Here, would it make sense to do 3-4 categories, dropping things which 
CANNOT in general setups on devices such as:

  - servers (phone battery, vibrator, etc.)
  - desktops and laptops (embedded drivers, etc.)
  - mobile, e.g., phone and tablets (RAID array on PCIe, network routing 
chip, etc.)
  - basic embedded and routers

If we go by the Pareto principle (~ 80/20) with low effort and easy 
maintenance, we could manage smaller, more efficient images. 
Distributions (or people) who don't want to risk any inconvenience or 
have an obscure setup will just not use the fragments.

What do you think?

If there is a consensus on some parts, I'll prepare some basic small series.

David

P.S. Sorry for the late reply, Thunderbird decided to encrypt my Draft, 
but somehow forgot how to decrypt it...

> 
>        Arnd

-- 
David Heidelberg

