Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92937361966;
	Fri, 14 Aug 2026 10:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786703483; cv=none; b=IZJSgi+liF6Z+YEY5OiXXV0At7mMOmrPZ0TiO/jrNpe5t/gt2n/JnlHCuM2FIedg06lb5e37gGLrv8/BUrJlk+CjuVjsyQ56td9WBWdoYCMLuFagxukwmdgP3mwPSoFW3HvKXuTojAVb61j8ne1Cirx9UoUmSmy25np7G77NDgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786703483; c=relaxed/simple;
	bh=x184bNmNwLs9tj1ULAmrZbwCOx8XgicDUHsToUTZ/0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D4WD4Bsys9qQffuhWzeyPgixKEVDihTXoqO99qHqFZtIl1HoTDQzzcGn01/7e3Vh61Oi11+dsUySGeiwATYwm/wIipPzo64SW2vA399uLjKTGp2Q6dgyCRCCHGhBcO8519hRwvLuF3oSpYTH4G22OYc+BkkeZFPGmIR/oAB7XWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CsZinVx9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CsZinVx9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786703475; x=1818239475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x184bNmNwLs9tj1ULAmrZbwCOx8XgicDUHsToUTZ/0I=;
  b=CsZinVx9u58uRmpBIqxwQAJ2EhW6OZA9BGqudcddDjGHsV6576PCGLXz
   DCjo9IACVsGvfmKDTUvrTjlLtO68B5BXpcFJfvg+VBoCuw2qbeifAa+Xo
   /ufSFPHOKKqmg0W6s/sGZyxcvFboV3//9r9cLv8q/ohRLQrAgJBHieIHF
   Zo+PPBzScTXmuY8IBTdAJp//3UDmtYqFSFUQAsXJse/+a8z2SwLl/A/O4
   l/9qtTg7kiBGjBJHg02MoKjibVIcuwd4zsBtZKikNulCFI2azKPq2YS8+
   o5SNZDqLgL1cIfwVeErHZxXeXXsuLUEjNLR3vJud78NBkxbEWGB9ZF/Ek
   g==;
X-CSE-ConnectionGUID: brtVBYqgRRqMr4RPwc41ig==
X-CSE-MsgGUID: LEFUEBmiRgWPtK/wueaIhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="98795713"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="98795713"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 03:31:06 -0700
X-CSE-ConnectionGUID: XcXKS50nQ9KJEFgicerPFg==
X-CSE-MsgGUID: 0BjiolWjQVKzgTBDSN6vEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="263753970"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 14 Aug 2026 03:31:03 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 4D03D99; Fri, 14 Aug 2026 12:31:02 +0200 (CEST)
Date: Fri, 14 Aug 2026 12:31:02 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: esteuwu@proton.me
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] usb: typec: Add support for Parade PS5169 USB
 Type-C redriver
Message-ID: <an7uZqb31GoZy65d@black.igk.intel.com>
References: <20260810-ps5169-bup-v3-0-a2178b2834d7@proton.me>
 <20260810-ps5169-bup-v3-2-a2178b2834d7@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810-ps5169-bup-v3-2-a2178b2834d7@proton.me>

Hi Esteban,

On Mon, Aug 10, 2026 at 11:31:37PM -0400, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Add driver for the Parade PS5169, an USB Type-C redriver capable of
> handling 10Gb/s USB signals and 8.1Gb/s DP signals.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  MAINTAINERS                    |   7 +
>  drivers/usb/typec/mux/Kconfig  |  10 +
>  drivers/usb/typec/mux/Makefile |   1 +
>  drivers/usb/typec/mux/ps5169.c | 592 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 610 insertions(+)

This does not compile...

> diff --git a/drivers/usb/typec/mux/ps5169.c b/drivers/usb/typec/mux/ps5169.c
> new file mode 100644
> index 000000000000..5fbc452249d0
> --- /dev/null
> +++ b/drivers/usb/typec/mux/ps5169.c
> @@ -0,0 +1,592 @@
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

You are missing a lot of headers here. Please include everything that
you are using - don't rely on nested includes. I think that's the rule
nowadays.

Thanks,

-- 
heikki
