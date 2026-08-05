Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECA6456281;
	Wed,  5 Aug 2026 12:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785931290; cv=none; b=E9EpybUMR9y6PaXl0fJNGBVSksjDKXETW49YoFpuZdHHQ7zMoNUU5vW5R81739hjIa9GUn2FX4EUL0JE2pFY83Vtai8pqZ+fqbLhLifNWbM6JwEEj5oR0y808LXHXH4ZKQVtUW+ldacZRIRunxEg83nG7Siy4ztHgpUOTihkWSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785931290; c=relaxed/simple;
	bh=hHqrRyeV1rUi3pCskb177eiXh+0lNoQL4qWDrUjKqYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEsR179Ne58upqXkQ6m5yOZm1HCH2cSCBrD1XlMJqVN357ktXzcpHIb2IlMcTaYSFlg4SaR7bFLnmF44AipykYVKKaXtlVK5Vp/q/0jFw4a6bDsqx1tz8g5d90sgWy8me5r34SgzdabxO2Uk6GUKV2v+z9VpFbbWEWA6WQTZE/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SGoiIrdV; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SGoiIrdV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785931287; x=1817467287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hHqrRyeV1rUi3pCskb177eiXh+0lNoQL4qWDrUjKqYc=;
  b=SGoiIrdVjv/SrWQeuPN2GGfjifqWRTackM/36KoAtaYoYoiN2wc9D+5L
   7VwOnhecKK0HJor28JYh12OnGHkbkX3T/GQsCIgLUjN9Fp6eRaExgdO1b
   YSRSq1kF5t+aUV3EPy5yHl6tEIATxvx7uaxKVmtpkh8Nvs8NT3SIR+R12
   lPVShGbI+6TQDyWoOWKGO0iDVIsyzwWQYRwfsQeXS9ZaMus+s9rwFfj7H
   vclKFFfLClhxbaao38eynna5vZGNToPIEXTHi2tUphyAVNX9GnxMmYZEf
   yo5g5/3P2BU1Nr33D4A3XjR+lY8a2yGUs4uGelHf1DL/EXsmCEUH5pHuu
   A==;
X-CSE-ConnectionGUID: w8gRHPBpSg6IjyGRRujlwA==
X-CSE-MsgGUID: DducNo8yQTaeMEkqTy5jNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86512598"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="86512598"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 05:01:27 -0700
X-CSE-ConnectionGUID: nhHfDVa5R+W+hiE1gA4S1g==
X-CSE-MsgGUID: p6cGWX48Tx2f8AZ3LJi8Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="261854739"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 05 Aug 2026 05:01:24 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id A0DF299; Wed, 05 Aug 2026 14:01:22 +0200 (CEST)
Date: Wed, 5 Aug 2026 14:01:22 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: esteuwu@proton.me
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: typec: Add support for Parade PS5169 USB Type-C
 redriver
Message-ID: <anMmEgKni7jB8ji8@black.igk.intel.com>
References: <20260727-ps5169-bup-v1-0-c76a8ef3b239@proton.me>
 <20260727-ps5169-bup-v1-2-c76a8ef3b239@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-ps5169-bup-v1-2-c76a8ef3b239@proton.me>

On Mon, Jul 27, 2026 at 09:19:35PM -0400, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Add driver for the Parade PS5169, an USB Type-C redriver capable of
> handling 10Gb/s USB signals and 8.1Gb/s DisplayPort signals.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  MAINTAINERS                    |   7 +
>  drivers/usb/typec/mux/Kconfig  |  10 +
>  drivers/usb/typec/mux/Makefile |   1 +
>  drivers/usb/typec/mux/ps5169.c | 535 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 553 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cc3c01eecfa2..3fa3a795c29b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28277,6 +28277,13 @@ F:	drivers/usb/typec/tcpm/tcpm.c
>  F:	include/linux/usb/tcpci.h
>  F:	include/linux/usb/tcpm.h
>  
> +USB TYPEC PS5169 MUX DRIVER
> +M:	Esteban Urrutia <esteuwu@proton.me>
> +L:	linux-usb@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/usb/parade,ps5169.yaml
> +F:	drivers/usb/typec/mux/ps5169.c
> +
>  USB TYPEC TUSB1046 MUX DRIVER
>  M:	Romain Gantois <romain.gantois@bootlin.com>
>  L:	linux-usb@vger.kernel.org
> diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
> index 6dd8f961b593..2838a53ce564 100644
> --- a/drivers/usb/typec/mux/Kconfig
> +++ b/drivers/usb/typec/mux/Kconfig
> @@ -56,6 +56,16 @@ config TYPEC_MUX_NB7VPQ904M
>  	  Say Y or M if your system has a On Semiconductor NB7VPQ904M Type-C
>  	  redriver chip found on some devices with a Type-C port.
>  
> +config TYPEC_MUX_PS5169
> +	tristate "Parade PS5169 Type-C redriver driver"
> +	depends on I2C
> +	depends on DRM || DRM=n
> +	select DRM_AUX_BRIDGE if DRM_BRIDGE && OF
> +	select REGMAP_I2C
> +	help
> +	  Say Y or M if your system has a Parade PS5169 Type-C redriver chip
> +	  found on some devices with a Type-C port.
> +
>  config TYPEC_MUX_PS883X
>  	tristate "Parade PS883x Type-C retimer driver"
>  	depends on I2C
> diff --git a/drivers/usb/typec/mux/Makefile b/drivers/usb/typec/mux/Makefile
> index b4f599eb5053..c775bfa12068 100644
> --- a/drivers/usb/typec/mux/Makefile
> +++ b/drivers/usb/typec/mux/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_TYPEC_MUX_PI3USB30532)	+= pi3usb30532.o
>  obj-$(CONFIG_TYPEC_MUX_INTEL_PMC)	+= intel_pmc_mux.o
>  obj-$(CONFIG_TYPEC_MUX_IT5205)		+= it5205.o
>  obj-$(CONFIG_TYPEC_MUX_NB7VPQ904M)	+= nb7vpq904m.o
> +obj-$(CONFIG_TYPEC_MUX_PS5169)		+= ps5169.o
>  obj-$(CONFIG_TYPEC_MUX_PS883X)		+= ps883x.o
>  obj-$(CONFIG_TYPEC_MUX_PTN36502)	+= ptn36502.o
>  obj-$(CONFIG_TYPEC_MUX_TUSB1046)	+= tusb1046.o
> diff --git a/drivers/usb/typec/mux/ps5169.c b/drivers/usb/typec/mux/ps5169.c
> new file mode 100644
> index 000000000000..3ee04843fa2d
> --- /dev/null
> +++ b/drivers/usb/typec/mux/ps5169.c
> @@ -0,0 +1,535 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Driver for Parade PS5169 USB Type-C linear redriver
> + * Registers and bits decoded from downstream drivers
> + *
> + * Copyright (c) 2026 Esteban Urrutia <esteuwu@proton.me>
> + */
> +
> +#include <drm/bridge/aux-bridge.h>
> +
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +
> +#include <linux/usb/typec_altmode.h>
> +#include <linux/usb/typec_dp.h>
> +#include <linux/usb/typec_mux.h>
> +#include <linux/usb/typec_retimer.h>
> +
> +/* Useful constants */
> +#define PS5169_DP_EQ_REG_COUNT		2
> +#define PS5169_USB_RX_EQ_REG_COUNT	4
> +#define PS5169_USB_TX_EQ_REG_COUNT	3
> +
> +#define PS5169_DP_EQ_LEVEL_COUNT	8
> +#define PS5169_USB_RX_EQ_LEVEL_COUNT	8
> +#define PS5169_USB_TX_EQ_LEVEL_COUNT	8
> +
> +/* PS5169 registers */
> +#define PS5169_CONFIG_REG		0x40
> +#define PS5169_GAIN_REG			0x5c
> +#define PS5169_USB_RX1_LFPS_REG		0x8d
> +#define PS5169_USB_RX2_LFPS_REG		0x90
> +#define PS5169_AUX_RX_DATA_REG		0x9f
> +#define PS5169_AUX_MONITORING_REG	0xa0
> +#define PS5169_HPD_LEVEL_REG		0xa1
> +#define PS5169_CHIP_ID_REG		0xac
> +#define PS5169_CHIP_REVISION_REG	0xae
> +/* Chip revision is split in two registers */
> +#define PS5169_MAX_REG			(PS5169_CHIP_REVISION_REG + 1)
> +
> +/* PS5169 register bits */
> +#define PS5169_CONFIG_REVERSE		BIT(4)
> +#define PS5169_CONFIG_DP_EN		BIT(5)
> +#define PS5169_CONFIG_USB3_EN		BIT(6)
> +#define PS5169_CONFIG_BASE		BIT(7)
> +
> +#define PS5169_GAIN_DP			BIT(4)
> +#define PS5169_GAIN_USB_RX		BIT(2)
> +#define PS5169_GAIN_USB_TX		BIT(0)
> +
> +#define PS5169_USB_RX_LFPS_50_OHM	BIT(0)
> +
> +#define PS5169_AUX_RX_DATA_REVERSE	BIT(1)
> +
> +#define PS5169_AUX_MONITORING_BIT	BIT(1)
> +#define PS5169_HPD_LEVEL_BIT		BIT(2)
> +
> +/* PS5169 register values */
> +#define PS5169_CHIP_ID			0x6987
> +
> +/* PS5169 register tables */
> +static const int ps5169_dp_eq_reg[PS5169_DP_EQ_REG_COUNT]		= {0x52, 0x5e};
> +static const int ps5169_usb_rx_eq_reg[PS5169_USB_RX_EQ_REG_COUNT]	= {0x51, 0x77, 0x54, 0x78};
> +static const int ps5169_usb_tx_eq_reg[PS5169_USB_TX_EQ_REG_COUNT]	= {0x50, 0x5d, 0x54};
> +
> +/* PS5169 register mask tables */
> +static const int ps5169_dp_eq_mask[PS5169_DP_EQ_REG_COUNT]		= {0x70, 0x07};
> +static const int ps5169_usb_rx_eq_mask[PS5169_USB_RX_EQ_REG_COUNT]	= {0xf6, 0xf0, 0x0f, 0xe1};
> +static const int ps5169_usb_tx_eq_mask[PS5169_USB_TX_EQ_REG_COUNT]	= {0x70, 0x70, 0xf0};
> +
> +/* PS5169 register value tables */
> +static const int ps5169_dp_eq[PS5169_DP_EQ_LEVEL_COUNT][PS5169_DP_EQ_REG_COUNT] = {
> +	{0x00, 0x04},			/* 2    dB */
> +	{0x10, 0x05},			/* 5.5  dB */
> +	{0x20, 0x06},			/* 6.5  dB */
> +	{0x30, 0x06},			/* 7.5  dB */
> +	{0x40, 0x06},			/* 8    dB */
> +	{0x50, 0x07},			/* 8.5  dB */
> +	{0x60, 0x07},			/* 9.5  dB */
> +	{0x70, 0x07},			/* 10   dB, supposedly */
> +};
> +
> +static const int ps5169_usb_rx_eq[PS5169_USB_RX_EQ_LEVEL_COUNT][PS5169_USB_RX_EQ_REG_COUNT] = {
> +	{0x86, 0x00, 0x00, 0x20},	/* 5.2  dB */
> +	{0x96, 0x00, 0x01, 0x20},	/* 6    dB */
> +	{0xa6, 0x50, 0x01, 0x40},	/* 7    dB */
> +	{0xb6, 0x50, 0x05, 0x40},	/* 8    dB */
> +	{0xc6, 0xb0, 0x0c, 0x80},	/* 8.8  dB */
> +	{0xd6, 0xf0, 0x05, 0x80},	/* 9.6  dB */
> +	{0xe6, 0xf0, 0x0f, 0x80},	/* 10.4 dB */
> +	{0xf6, 0x30, 0x0f, 0xa1},	/* 11.2 dB */
> +};
> +
> +static const int ps5169_usb_tx_eq[PS5169_USB_TX_EQ_LEVEL_COUNT][PS5169_USB_TX_EQ_REG_COUNT] = {
> +	{0x00, 0x40, 0x00},		/* 2    dB */
> +	{0x10, 0x50, 0x10},		/* 5.5  dB */
> +	{0x20, 0x60, 0x10},		/* 6.5  dB */
> +	{0x30, 0x60, 0x50},		/* 7.5  dB */
> +	{0x40, 0x60, 0xc0},		/* 8    dB */
> +	{0x50, 0x70, 0x50},		/* 8.5  dB */
> +	{0x60, 0x70, 0xf0},		/* 9.5  dB */
> +	{0x70, 0x70, 0xf0},		/* 10   dB, supposedly */
> +};
> +
> +struct redriver {
> +	struct regulator *vcc;
> +	struct gpio_desc *reset_gpio;
> +
> +	struct regmap *regmap;
> +
> +	struct typec_switch *typec_switch;
> +	struct typec_mux *typec_mux;
> +
> +	struct typec_switch_dev *sw;
> +	struct typec_retimer *retimer;
> +
> +	unsigned long mode;
> +	enum typec_orientation orientation;
> +
> +	u32 dp_eq;
> +	u32 usb_rx_eq;
> +	u32 usb_tx_eq;
> +
> +	bool aux_rx_data_reverse;
> +	bool tune_lfps;
> +
> +	bool dp_set_gain;
> +	bool usb_rx_set_gain;
> +	bool usb_tx_set_gain;
> +
> +	struct mutex lock; /* protect non-concurrent retimer & switch */
> +
> +	unsigned int svid;
> +};
> +
> +static const struct regmap_config ps5169_regmap = {
> +	.max_register = PS5169_MAX_REG,
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	/* Accesses only done under ps5169->lock */
> +	.disable_locking = true,
> +};
> +
> +static void ps5169_write(struct redriver *ps5169, unsigned int reg, unsigned int val)
> +{
> +	regmap_write(ps5169->regmap, reg, val);
> +
> +	if (val & PS5169_CONFIG_DP_EN) {
> +		/* Clearing this bit will enable the AUX channel */
> +		regmap_clear_bits(ps5169->regmap, PS5169_AUX_MONITORING_REG,
> +				  PS5169_AUX_MONITORING_BIT);
> +		/* Setting this bit will set a high HPD level */
> +		regmap_set_bits(ps5169->regmap, PS5169_HPD_LEVEL_REG, PS5169_HPD_LEVEL_BIT);
> +	} else {
> +		/* Setting this bit will disable the AUX channel */
> +		regmap_set_bits(ps5169->regmap, PS5169_AUX_MONITORING_REG,
> +				PS5169_AUX_MONITORING_BIT);
> +		/* Clearing this bit will set a low HPD level */
> +		regmap_clear_bits(ps5169->regmap, PS5169_HPD_LEVEL_REG, PS5169_HPD_LEVEL_BIT);
> +	}
> +
> +	if (ps5169->tune_lfps) {
> +		if (val & PS5169_CONFIG_USB3_EN) {
> +			/* Setting these bits will enable a 50 ohm termination on USB RX */
> +			regmap_set_bits(ps5169->regmap, PS5169_USB_RX1_LFPS_REG,
> +					PS5169_USB_RX_LFPS_50_OHM);
> +			regmap_set_bits(ps5169->regmap, PS5169_USB_RX2_LFPS_REG,
> +					PS5169_USB_RX_LFPS_50_OHM);
> +		} else {
> +			/* Clearing these bits will disable a 50 ohm termination on USB RX */
> +			regmap_clear_bits(ps5169->regmap, PS5169_USB_RX1_LFPS_REG,
> +					  PS5169_USB_RX_LFPS_50_OHM);
> +			regmap_clear_bits(ps5169->regmap, PS5169_USB_RX2_LFPS_REG,
> +					  PS5169_USB_RX_LFPS_50_OHM);
> +		}
> +	}
> +}
> +
> +static int ps5169_set(struct redriver *ps5169)
> +{
> +	bool reverse = (ps5169->orientation == TYPEC_ORIENTATION_REVERSE);
> +	unsigned int val = PS5169_CONFIG_BASE;
> +
> +	switch (ps5169->mode) {
> +	case TYPEC_STATE_SAFE:
> +		ps5169_write(ps5169, PS5169_CONFIG_REG, val);
> +
> +		return 0;
> +
> +	case TYPEC_STATE_USB:
> +		val |= PS5169_CONFIG_USB3_EN;
> +		if (reverse)
> +			val |= PS5169_CONFIG_REVERSE;
> +		ps5169_write(ps5169, PS5169_CONFIG_REG, val);
> +
> +		return 0;
> +
> +	default:
> +		if (ps5169->svid != USB_TYPEC_DP_SID)
> +			return -EINVAL;
> +
> +		break;
> +	}
> +
> +	switch (ps5169->mode) {
> +	case TYPEC_DP_STATE_C:
> +	case TYPEC_DP_STATE_E:
> +		val |= PS5169_CONFIG_DP_EN;
> +		if (reverse)
> +			val |= PS5169_CONFIG_REVERSE;
> +		ps5169_write(ps5169, PS5169_CONFIG_REG, val);
> +
> +		break;
> +
> +	case TYPEC_DP_STATE_D:
> +		val |= PS5169_CONFIG_DP_EN | PS5169_CONFIG_USB3_EN;
> +		if (reverse)
> +			val |= PS5169_CONFIG_REVERSE;
> +		ps5169_write(ps5169, PS5169_CONFIG_REG, val);
> +
> +		break;
> +
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ps5169_switch_set(struct typec_switch_dev *sw, enum typec_orientation orientation)
> +{
> +	struct redriver *ps5169 = typec_switch_get_drvdata(sw);
> +	int ret;
> +
> +	ret = typec_switch_set(ps5169->typec_switch, orientation);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&ps5169->lock);
> +
> +	if (ps5169->orientation != orientation) {
> +		ps5169->orientation = orientation;
> +
> +		ret = ps5169_set(ps5169);
> +	}
> +
> +	mutex_unlock(&ps5169->lock);
> +
> +	return ret;
> +}
> +
> +static int ps5169_retimer_set(struct typec_retimer *retimer, struct typec_retimer_state *state)
> +{
> +	struct redriver *ps5169 = typec_retimer_get_drvdata(retimer);
> +	struct typec_mux_state mux_state;
> +	int ret = 0;
> +
> +	mutex_lock(&ps5169->lock);
> +
> +	if (ps5169->mode != state->mode) {
> +		ps5169->mode = state->mode;
> +
> +		if (state->alt)
> +			ps5169->svid = state->alt->svid;
> +		else
> +			ps5169->svid = 0; // No SVID
> +
> +		ret = ps5169_set(ps5169);
> +	}
> +
> +	mutex_unlock(&ps5169->lock);
> +
> +	if (ret)
> +		return ret;
> +
> +	mux_state.alt = state->alt;
> +	mux_state.data = state->data;
> +	mux_state.mode = state->mode;
> +
> +	return typec_mux_set(ps5169->typec_mux, &mux_state);
> +}
> +
> +static void ps5169_init(struct redriver *ps5169)
> +{
> +	int i;
> +
> +	/* DP equalization */
> +	if (ps5169->dp_eq != U32_MAX)
> +		for (i = 0; i < PS5169_DP_EQ_REG_COUNT; i++)
> +			regmap_update_bits(ps5169->regmap, ps5169_dp_eq_reg[i],
> +					   ps5169_dp_eq_mask[i], ps5169_dp_eq[ps5169->dp_eq][i]);
> +
> +	/* USB RX equalization */
> +	if (ps5169->usb_rx_eq != U32_MAX)
> +		for (i = 0; i < PS5169_USB_RX_EQ_REG_COUNT; i++)
> +			regmap_update_bits(ps5169->regmap, ps5169_usb_rx_eq_reg[i],
> +					   ps5169_usb_rx_eq_mask[i],
> +					   ps5169_usb_rx_eq[ps5169->usb_rx_eq][i]);
> +
> +	/* USB TX equalization */
> +	if (ps5169->usb_tx_eq != U32_MAX)
> +		for (i = 0; i < PS5169_USB_TX_EQ_REG_COUNT; i++)
> +			regmap_update_bits(ps5169->regmap, ps5169_usb_tx_eq_reg[i],
> +					   ps5169_usb_tx_eq_mask[i],
> +					   ps5169_usb_tx_eq[ps5169->usb_tx_eq][i]);
> +
> +	/* Some devices set this bit in this register, but its effect is unknown */
> +	regmap_assign_bits(ps5169->regmap, PS5169_AUX_RX_DATA_REG, PS5169_AUX_RX_DATA_REVERSE,
> +			   ps5169->aux_rx_data_reverse);
> +
> +	/* If these bits are assigned a -0.9 dB gain will be set on the corresponding channels */
> +	regmap_assign_bits(ps5169->regmap, PS5169_GAIN_REG, PS5169_GAIN_DP, ps5169->dp_set_gain);
> +	regmap_assign_bits(ps5169->regmap, PS5169_GAIN_REG, PS5169_GAIN_USB_RX,
> +			   ps5169->usb_rx_set_gain);
> +	regmap_assign_bits(ps5169->regmap, PS5169_GAIN_REG, PS5169_GAIN_USB_TX,
> +			   ps5169->usb_tx_set_gain);
> +}
> +
> +static int ps5169_probe(struct i2c_client *client)
> +{
> +	struct redriver *ps5169;
> +	struct device *dev = &client->dev;
> +	int ret;
> +	u16 chip_id;
> +	u16 chip_revision;
> +	struct typec_switch_desc switch_desc = { };
> +	struct typec_retimer_desc retimer_desc = { };
> +
> +	ps5169 = devm_kzalloc(dev, sizeof(*ps5169), GFP_KERNEL);
> +	if (!ps5169)
> +		return -ENOMEM;
> +
> +	ps5169->vcc = devm_regulator_get(dev, "vcc");
> +	if (IS_ERR(ps5169->vcc))
> +		return dev_err_probe(dev, PTR_ERR(ps5169->vcc), "Failed to get vcc-supply\n");
> +
> +	ps5169->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ps5169->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ps5169->reset_gpio),
> +				     "Failed to get reset-gpios\n");
> +
> +	ps5169->regmap = devm_regmap_init_i2c(client, &ps5169_regmap);
> +	if (IS_ERR(ps5169->regmap))
> +		return dev_err_probe(dev, PTR_ERR(ps5169->regmap), "Failed to initialize regmap\n");
> +
> +	ps5169->typec_switch = typec_switch_get(dev);
> +	if (IS_ERR(ps5169->typec_switch))
> +		return dev_err_probe(dev, PTR_ERR(ps5169->typec_switch),
> +				     "Failed to get orientation-switch\n");
> +
> +	ps5169->typec_mux = typec_mux_get(dev);
> +	if (IS_ERR(ps5169->typec_mux)) {
> +		ret = dev_err_probe(dev, PTR_ERR(ps5169->typec_mux), "Failed to get mode-switch\n");
> +		goto switch_put;
> +	}
> +
> +	ret = regulator_enable(ps5169->vcc);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable vcc-supply\n");
> +		goto mux_put;
> +	}
> +
> +	/* Reset the retimer */
> +	gpiod_set_value(ps5169->reset_gpio, 1);
> +	usleep_range(1000, 1500);
> +	gpiod_set_value(ps5169->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +
> +	ret = regmap_raw_read(ps5169->regmap, PS5169_CHIP_ID_REG, &chip_id, sizeof(chip_id));
> +	if (ret) {
> +		dev_err(dev, "Failed to read chip ID\n");
> +		goto vcc_disable;
> +	}
> +
> +	/* Compare chip IDs */
> +	if (chip_id != PS5169_CHIP_ID) {
> +		dev_err(dev, "Unexpected chip ID 0x%04x\n", chip_id);
> +		goto vcc_disable;
> +	}
> +
> +	/* Read chip revision */
> +	ret = regmap_raw_read(ps5169->regmap, PS5169_CHIP_REVISION_REG, &chip_revision,
> +			      sizeof(chip_revision));
> +	if (ret) {
> +		dev_err(dev, "Failed to read chip revision\n");
> +		goto vcc_disable;
> +	}
> +	dev_dbg(dev, "Found PS5169 with chip revision 0x%04x\n", chip_revision);
> +
> +	ret = drm_aux_bridge_register(dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to register aux_bridge\n");
> +		goto vcc_disable;
> +	}
> +
> +	/* orientation-switch */
> +	switch_desc.drvdata = ps5169;
> +	switch_desc.fwnode = dev_fwnode(dev);
> +	switch_desc.set = ps5169_switch_set;
> +
> +	ps5169->sw = typec_switch_register(dev, &switch_desc);
> +	if (IS_ERR(ps5169->sw)) {
> +		ret = dev_err_probe(dev, PTR_ERR(ps5169->sw), "Failed to register switch\n");
> +		goto vcc_disable;
> +	}
> +
> +	/* retimer-switch */
> +	retimer_desc.drvdata = ps5169;
> +	retimer_desc.fwnode = dev_fwnode(dev);
> +	retimer_desc.set = ps5169_retimer_set;
> +
> +	ps5169->retimer = typec_retimer_register(dev, &retimer_desc);
> +	if (IS_ERR(ps5169->retimer)) {
> +		ret = dev_err_probe(dev, PTR_ERR(ps5169->retimer), "Failed to register retimer\n");
> +		goto switch_unregister;
> +	}
> +
> +	ps5169->mode = TYPEC_STATE_SAFE;
> +	ps5169->orientation = TYPEC_ORIENTATION_NONE;
> +
> +	/* DP equalization */
> +	if (device_property_present(dev, "parade,dp-eq-level")) {
> +		ret = device_property_read_u32(dev, "parade,dp-eq-level", &ps5169->dp_eq);
> +		if (ret) {
> +			dev_err(dev, "Failed to read parade,dp-eq-level\n");
> +			goto switch_unregister;
> +		}
> +		if (ps5169->dp_eq > PS5169_DP_EQ_LEVEL_COUNT - 1) {
> +			dev_err(dev, "parade,dp-eq-level exceeds maximum of %d\n",
> +				PS5169_DP_EQ_LEVEL_COUNT - 1);
> +			ret = -EINVAL;
> +			goto switch_unregister;
> +		}
> +	} else {
> +		dev_warn(dev, "parade,dp-eq-level is not present, leaving DP EQ as is\n");
> +		ps5169->dp_eq = U32_MAX;
> +	}
> +
> +	/* USB RX equalization */
> +	if (device_property_present(dev, "parade,usb-rx-eq-level")) {
> +		ret = device_property_read_u32(dev, "parade,usb-rx-eq-level", &ps5169->usb_rx_eq);
> +		if (ret) {
> +			dev_err(dev, "Failed to read parade,usb-rx-eq-level\n");
> +			goto switch_unregister;
> +		}
> +		if (ps5169->usb_rx_eq > PS5169_USB_RX_EQ_LEVEL_COUNT - 1) {
> +			dev_err(dev, "parade,usb-rx-eq-level exceeds maximum of %d\n",
> +				PS5169_USB_RX_EQ_LEVEL_COUNT - 1);
> +			ret = -EINVAL;
> +			goto switch_unregister;
> +		}
> +	} else {
> +		dev_warn(dev, "parade,usb-rx-eq-level is not present, leaving USB RX EQ as is\n");
> +		ps5169->usb_rx_eq = U32_MAX;
> +	}
> +
> +	/* USB TX equalization */
> +	if (device_property_present(dev, "parade,usb-tx-eq-level")) {
> +		ret = device_property_read_u32(dev, "parade,usb-tx-eq-level", &ps5169->usb_tx_eq);
> +		if (ret) {
> +			dev_err(dev, "Failed to read parade,usb-tx-eq-level\n");
> +			goto switch_unregister;
> +		}
> +		if (ps5169->usb_tx_eq > PS5169_USB_TX_EQ_LEVEL_COUNT - 1) {
> +			dev_err(dev, "parade,usb-tx-eq-level exceeds maximum of %d\n",
> +				PS5169_USB_TX_EQ_LEVEL_COUNT - 1);
> +			ret = -EINVAL;
> +			goto switch_unregister;
> +		}
> +	} else {
> +		dev_warn(dev, "parade,usb-tx-eq-level is not present, leaving USB TX EQ as is\n");
> +		ps5169->usb_tx_eq = U32_MAX;
> +	}
> +
> +	/* Read properties from DT */
> +	ps5169->aux_rx_data_reverse = device_property_read_bool(dev, "parade,aux-rx-data-reverse");
> +	ps5169->tune_lfps = device_property_read_bool(dev, "parade,fine-tune-lfps-swing");
> +	ps5169->dp_set_gain = device_property_read_bool(dev, "parade,dp-set-gain");
> +	ps5169->usb_rx_set_gain = device_property_read_bool(dev, "parade,usb-rx-set-gain");
> +	ps5169->usb_tx_set_gain = device_property_read_bool(dev, "parade,usb-tx-set-gain");
> +
> +	ps5169_init(ps5169);
> +
> +	mutex_init(&ps5169->lock);
> +
> +	i2c_set_clientdata(client, ps5169);
> +
> +	return 0;
> +
> +switch_unregister:
> +	typec_switch_unregister(ps5169->sw);
> +
> +vcc_disable:
> +	regulator_disable(ps5169->vcc);
> +
> +mux_put:
> +	typec_mux_put(ps5169->typec_mux);
> +switch_put:
> +	typec_switch_put(ps5169->typec_switch);
> +
> +	return ret;
> +}
> +
> +static void ps5169_remove(struct i2c_client *client)
> +{
> +	struct redriver *ps5169 = i2c_get_clientdata(client);
> +
> +	typec_retimer_unregister(ps5169->retimer);
> +	typec_switch_unregister(ps5169->sw);
> +
> +	regulator_disable(ps5169->vcc);
> +
> +	typec_mux_put(ps5169->typec_mux);
> +	typec_switch_put(ps5169->typec_switch);
> +}
> +
> +static const struct of_device_id ps5169_of_match_table[] = {
> +	{ .compatible = "parade,ps5169" },
> +	{ },
> +};
> +
> +static struct i2c_driver ps5169_driver = {
> +	.driver = {
> +		.name = "ps5169",
> +		.of_match_table = ps5169_of_match_table,
> +	},
> +	.probe = ps5169_probe,
> +	.remove = ps5169_remove,
> +};
> +
> +module_i2c_driver(ps5169_driver);
> +
> +MODULE_AUTHOR("Esteban Urrutia <esteuwu@proton.me>");
> +MODULE_DESCRIPTION("Driver for Parade PS5169 USB Type-C linear redriver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.55.0
> 

-- 
heikki
