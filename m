Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562C12820A9
	for <phone-devel@vger.kernel.org>; Thu, 18 Jun 2026 14:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781793223; cv=pass; b=JCcvsiQgnSNlShMWhGUGE+Brk1vUoku/zWJVTLDodH5ez6kRHBBFO7j1I0cQre39nMsu2ponSk3zfUF01zId9zx8RgpyD3MJpR23yeNeY9H0rgJwlA2X9kTkN4cZJo2Vgf/gvrNa16zYZqUYj89w27+YjP+GacWC6tF0fcwHKM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781793223; c=relaxed/simple;
	bh=jULijdUlij+60uDAGV4Evc7NhZ7xPn68RU33MXjUNZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cTrrb1US8JJVMlVrgppVexXXb4FsXJ/lHiA8voJLzjlDQ6FzzBgZ/+C5LjfJS1ZLkXiZEmol3utXvQv0aCor9uMJWpG6u/T6yN+Su7zaemmRnPAtRYVpVt07VpnPCE55fqHA05NUCdrCAgSVlKLLNdnnrxMyuuakXdr8CQ/RUqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Hn80op0z; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Hn80op0z"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5ad53c8d4dfso525397e87.1
        for <phone-devel@vger.kernel.org>; Thu, 18 Jun 2026 07:33:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781793218; cv=none;
        d=google.com; s=arc-20240605;
        b=ZSDpXJWvAHbnLr8YAxG3w6pAHrfEBiwz+yqUP3e6yX9Nh1+AIApwdtTobdNWqiL8g1
         sYJ5YaUkCY/6IgaBTf65uTK+767kZBamOK/7FQKJl61OCuuIlK63ZC39SvzqJi3Vt+RN
         kxe49gLbOzind2T+jRGR9v4ioFe4gfJssG34bUFB3I0g6auvBIj3H37qixWj8n/IR8TE
         SYUFrrrTaJDVhO75bqHAFJ67H5VfQY0mCKPUosDN2SRQvH1SZw8joTQFVok37wDWQYxV
         zi3ifv7pUYAz1uOYWORAUHUGN2/auxXEN4nGj709aQfoWes7UQUnJVywJD6oD0ky4DjJ
         lzyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VpqMN9sn3mEd34fhGVYnTO2psvx+L6VH+dxdrUJYH6o=;
        fh=WiA5qlpQHV/A29XuvHlFIpiyMA/NmnDDOEEdvaB84nU=;
        b=Qg8s6CiwhuRvFNXZHUlHrGDkBZU0n9v4sXxwiRIPeB/D4OPMiCwWTEhVQ4x1KhbfvO
         5TwKvw4hcPwES+1Zz4uiDB5CC567GRsMhQKhwZ6tFk8tXKCtLkODGuEJIaqbnUFEdv+e
         yCeuMzkwR2Wt/clAtasWkNZLJIJSE6W7vCdtdQ/YstQ33jz6pxbAMgqOSZXK4ufudj3+
         yQQvVga0fwWtCgRFQfYI7SMBHuivkNukBty0qfINCbmTht8HllS5IOKEV/FSE3H9r7KQ
         9wY8J7E/xMXpWH6Rlp7RiywmF8WUcnilSsPegj1VfXw+Sr/GRCVABY8AECm/BA5XtE7+
         ZvvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1781793218; x=1782398018; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VpqMN9sn3mEd34fhGVYnTO2psvx+L6VH+dxdrUJYH6o=;
        b=Hn80op0zwldW9Y9jn4lyTU7Vg5xwiDEKaC9O3W51QJp3GiPOWhQFC9F68mik8igR5+
         urCVtizvTiZRe9fyYqJ9xf4ZZp7NA5umXFEm+XAQikGZYP3WSQNG/7uf42JyxOluJ3WK
         b2oGUSb0V8sRaYnR0R9VzTwFIRmrjeR5rKv5XnNo9pN9P1HLRidZ2ewXDYjxPiIrNXqf
         OI/t8goE/T11af5WED0748Hc6lcspcF9yBc5e7tLJ2rGPvTadfsfBJqjEvdTLYoH96yz
         YTwIVHR2GhPfAW4EvM1YjIWQiWdss9xtnD+r3nozNJ5YVm5+yHZ2ExFjzWXBbbRXy1OQ
         HOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781793218; x=1782398018;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VpqMN9sn3mEd34fhGVYnTO2psvx+L6VH+dxdrUJYH6o=;
        b=Gcvd9GnBs6ynkOk+hgUlrVqzGQhDV2bD2y3fnozQCS2Wl74+3aOxvNUhK+6v0KBnQY
         g7s9iY4elLThuToJjLSARzK6JhOK1Bde2kiOAmijWekG0C34IvEXe9kztyM2DTccX6so
         SxP+uPJwDvuUhjxcrUjrfy60dUWxWTREw5giJu4qKjHumI7slN3JWxFkYcHjfpA61Sz2
         RNeWSNq1fLqoGY8NScNLav3wSHy7C4iqshIWARUwMrAGwJb0OYBuAABOh3P19YfB6HoI
         K+269ybOZkHgmjTYSiBp+Ldmgup+5DkNkSeb+kGvf+nRo8mRYe71fJpZzHQotZpGv8M/
         VEmw==
X-Forwarded-Encrypted: i=1; AFNElJ8wWw8SleC9eCkMSghPosf9jAT1HTUfHNA6SLboyIGpHsldONoa6l2VouYvrX8rVa3cs0J07Yx7lifW7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqOim5cuS9/kQYzeGKsTMT2fEU+F5Zgkvdbfs5Rk2SuWNToHrG
	12kxuLW/wcaiN8a0rVKCP3BoEne7RaMvcy6TWOzk2InRqfkwpWm16wZoyYEVh49sSxW3KxUPtAg
	Vv9aBYvh3xURXvpV5eqMRb7rY04QatVrStkakWW4w4A==
X-Gm-Gg: AfdE7cmxgk3qmhJeA5WsmnRWOmMRRfNjU3Rc0NDLX9rBgO5JpLZ7pSWkbtkPtGNh5Ys
	XvAhbShnhLxosMSGvMLe+dhwu4VdNXXmVgznmEbiN+eFRimsSvTK1BoQqADXE0HKc+JhInfvClj
	kc8xf3r6lVRZW1d5Bq4aFP6QBW1mVIyZk6fHUPbg9b6Krge9c7/1NAs/twrgeUCxwZ7Kr7F2wXm
	FUHTnD9ua5c58WNXgfVA1RQMjn0B6/CUcNqI/nMQL5imLDrny6MWZ9aWg/8VRp2rWRkBVrznhGv
	xKzFABHkCi0M+MrHS5ud/lnGLqBoD4uXucrJIbZhA2dit8iE6u8T3XyDBL3V3Ao0OMsW853EIa5
	ke3ICp4bZYKkDOw==
X-Received: by 2002:a05:6512:2c9b:b0:5ad:5431:c8cf with SMTP id
 2adb3069b0e04-5ad5431ca75mr361817e87.0.1781793218284; Thu, 18 Jun 2026
 07:33:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz>
 <CAPY8ntBrQaSn8bvw76qW1MF1=xcA+5u3XVvhGwO9AOO1nONu=Q@mail.gmail.com>
 <CAPY8ntA=1EK20GmqWJzzW7Tp8Mh8aXNad8+ZBG2xVcxrAkwVSA@mail.gmail.com> <effcf731-4325-4e27-9330-afa1ea709c9f@ixit.cz>
In-Reply-To: <effcf731-4325-4e27-9330-afa1ea709c9f@ixit.cz>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 18 Jun 2026 15:33:19 +0100
X-Gm-Features: AVVi8CfKu-HuBvb4CMWLwwRk2B12v2REnwvwrJ4La0CSput48NlhY0GULzO-jjQ
Message-ID: <CAPY8ntBFjhC6wpVBqpO1Oo4iGWzB+FZSdksKP_5Tk4oBcoD3dA@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx355: Add support for 24 MHz external clock
To: David Heidelberg <david@ixit.cz>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Richard Acayan <mailingradian@gmail.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Jun 2026 at 13:11, David Heidelberg <david@ixit.cz> wrote:
>
> On 17/06/2026 19:40, Dave Stevenson wrote:
> > Hi David
> >
> > On Thu, 16 Apr 2026 at 12:26, Dave Stevenson
> > <dave.stevenson@raspberrypi.com> wrote:
> >>
> >> Hi David
> >>
> >> On Tue, 14 Apr 2026 at 11:17, David Heidelberg via B4 Relay
> >> <devnull+david.ixit.cz@kernel.org> wrote:
> >>>
> >>> From: David Heidelberg <david@ixit.cz>
> >>>
> >>> The IMX355 sensor supports multiple external clock frequencies,
> >>> including 19.2 MHz and 24 MHz. The driver currently supports only
> >>> fixed 19.2 MHz input clock.
> >>>
> >>> Refactor the clock handling to make the PLL configuration dependent
> >>> on the external clock frequency and add support for 24 MHz. Introduce
> >>> a table of clock parameter sets and program the corresponding EXTCLK
> >>> frequency and PLL multipliers to maintain consistent internal VCO
> >>> frequencies across supported inputs.
> >>>
> >>> The PLL settings are adjusted so that:
> >>>    - VT VCO remains at 1152 MHz
> >>>    - OP VCO remains at 720 MHz
> >>>
> >>> This preserves existing timing characteristics while allowing systems
> >>> using a 24 MHz clock to operate correctly.
> >>
> >> I happened to have someone asking for this same requirement, so tried
> >> out your patch.
> >>
> >> I don't have a datasheet for IMX355, but the patterns very closely
> >> follow IMX477 and IMX708 for which I do.
> >> Those both have a single PLL and a dual PLL mode selected via register
> >> PLL_MULT_DRIV (0x0310). The imx355 driver is setting that to 0 for
> >> single PLL mode, which means that the PREDIV_IVT (0x0305) and MPY_IVT
> >> PLL (0x0306/7) settings do nothing as the IVT block is driven from
> >> IOPCK.
> >
> > I now have the datasheet and software reference manual for IMX355.
> >
> > It says that dual PLL mode is not available.
> > "In PLL single mode, IOP_PREPLLCK_DIV and IOP_PLL_MPY are applied to
> > IOPCK PLL, and IVT_PREPLLCK_DIV and IVT_PLL_MPY are ignored".
> > So there is no need to have alternate pll_vt_mpy values for 24MHz.
> >
> > I have no idea why Sony say that dual PLL mode isn't available. When I
> > was adding the 2 lane support I used it without any issues. I'm now
> > reworking those patches to avoid dual PLL mode.
>
> Maybe there is some ERRATA which makes it unstable or problematic?

Not mentioned in the information I've got, so it must have been
deleted as a feature very early in development.
C'est la vie.

> > Then again the datasheet also says that LINE_LENGTH_PCK is constrained
> > to 3672 in full res and 4x4 binning mode, and 1836 in 2x2 binned modes
> > "to avoid sensor internal interference (FPN)", so they obviously hit
> > some odd behaviours and just added constraints.
> >
> > Do you wish to send a V2 dropping pll_vt_mpy, or shall I pull it into my series?
>
> What works for you better (since u sending bigger changes than I do).

I'm happy to merge it into my series as that avoids having to declare
dependencies.
I had hoped to get my v2 out this week, but it just hasn't happened.
It won't be next week, but hopefully within the fortnight.

  Dave

> David
>
> >
> > Thanks
> >    Dave
> >
> >> Your patch therefore works, but does more than is necessary - you
> >> really can set pll_vt_mpy to any value and it works exactly the same.
> >> I guess changing the unconnected IVTCK clock within the sensor could
> >> feasibly change EMC emissions, but that feels pretty unlikely.
> >> Possibly add a comment to your existing comment of "VT VCO = 1152 MHz"
> >> to say that it's unused to avoid others going down the rabbit hole I
> >> encountered.
> >>
> >> (For those referencing the other datasheets, the description for
> >> single PLL mode lists configuring IVT_PREPLLCK_DIV and IVT_PLL_MPY,
> >> but the diagram shows that IOP is always driven from IOPCK, and IVT is
> >> muxed between IOPCK and IVTCK)
> >>
> >>> No functional change for existing 19.2 MHz users.
> >>>
> >>> Assisted-by: Claude:claude-opus-4-6
> >>> Signed-off-by: David Heidelberg <david@ixit.cz>
> >>
> >> Whilst useful comments could be added, it does what it says and works:
> >>
> >> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >> Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >>
> >>> ---
> >>> Known users: Pixel 3 and 3a.
> >>> ---
> >>>   drivers/media/i2c/imx355.c | 114 +++++++++++++++++++++------------------------
> >>>   1 file changed, 54 insertions(+), 60 deletions(-)
> >>>
> >>> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> >>> index 27a5c212a527f..f9ec13bb27d10 100644
> >>> --- a/drivers/media/i2c/imx355.c
> >>> +++ b/drivers/media/i2c/imx355.c
> >>> @@ -25,6 +25,11 @@
> >>>   #define IMX355_REG_CHIP_ID             0x0016
> >>>   #define IMX355_CHIP_ID                 0x0355
> >>>
> >>> +/* PLL registers that depend on the external clock frequency */
> >>> +#define IMX355_REG_EXTCLK_FREQ         0x0136
> >>> +#define IMX355_REG_PLL_VT_MUL          0x0306
> >>> +#define IMX355_REG_PLL_OP_MUL          0x030e
> >>> +
> >>>   /* V_TIMING internal */
> >>>   #define IMX355_REG_FLL                 0x0340
> >>>   #define IMX355_FLL_MAX                 0xffff
> >>> @@ -63,7 +68,6 @@
> >>>
> >>>   /* default link frequency and external clock */
> >>>   #define IMX355_LINK_FREQ_DEFAULT       360000000LL
> >>> -#define IMX355_EXT_CLK                 19200000
> >>>   #define IMX355_LINK_FREQ_INDEX         0
> >>>
> >>>   /* number of data lanes */
> >>> @@ -100,6 +104,33 @@ struct imx355_mode {
> >>>          struct imx355_reg_list reg_list;
> >>>   };
> >>>
> >>> +struct imx355_clk_params {
> >>> +       u32 ext_clk;
> >>> +       u16 extclk_freq; /* External clock (MHz) in 8.8 fixed point) */
> >>> +       u16 pll_vt_mpy; /* VT system PLL multiplier */
> >>> +       u16 pll_op_mpy; /* OP system PLL multiplier */
> >>> +};
> >>> +
> >>> +/*
> >>> + * All modes use the same PLL dividers (PREPLLCK_VT_DIV=2, PREPLLCK_OP_DIV=2),
> >>> + * so the multipliers are adjusted to produce the same VCO frequencies:
> >>> + *   VT VCO = 1152 MHz, OP VCO = 720 MHz
> >>> + */
> >>> +static const struct imx355_clk_params imx355_clk_params[] = {
> >>> +       {
> >>> +               .ext_clk = 19200000,
> >>> +               .extclk_freq = 0x1333,  /* 19.2 MHz */
> >>> +               .pll_vt_mpy = 120,      /* 19.2 / 2 * 120 = 1152 MHz */
> >>> +               .pll_op_mpy = 75,       /* 19.2 / 2 * 75  = 720 MHz */
> >>> +       },
> >>> +       {
> >>> +               .ext_clk = 24000000,
> >>> +               .extclk_freq = 0x1800,  /* 24.0 MHz */
> >>> +               .pll_vt_mpy = 96,       /* 24.0 / 2 * 96  = 1152 MHz */
> >>> +               .pll_op_mpy = 60,       /* 24.0 / 2 * 60  = 720 MHz */
> >>> +       },
> >>> +};
> >>> +
> >>>   struct imx355_hwcfg {
> >>>          unsigned long link_freq_bitmap;
> >>>   };
> >>> @@ -125,6 +156,7 @@ struct imx355 {
> >>>          const struct imx355_mode *cur_mode;
> >>>
> >>>          struct imx355_hwcfg *hwcfg;
> >>> +       const struct imx355_clk_params *clk_params;
> >>>
> >>>          /*
> >>>           * Mutex for serialized access:
> >>> @@ -144,8 +176,6 @@ static const struct regulator_bulk_data imx355_supplies[] = {
> >>>   };
> >>>
> >>>   static const struct imx355_reg imx355_global_regs[] = {
> >>> -       { 0x0136, 0x13 },
> >>> -       { 0x0137, 0x33 },
> >>>          { 0x304e, 0x03 },
> >>>          { 0x4348, 0x16 },
> >>>          { 0x4350, 0x19 },
> >>> @@ -231,12 +261,8 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
> >>>          { 0x0301, 0x05 },
> >>>          { 0x0303, 0x01 },
> >>>          { 0x0305, 0x02 },
> >>> -       { 0x0306, 0x00 },
> >>> -       { 0x0307, 0x78 },
> >>>          { 0x030b, 0x01 },
> >>>          { 0x030d, 0x02 },
> >>> -       { 0x030e, 0x00 },
> >>> -       { 0x030f, 0x4b },
> >>>          { 0x0310, 0x00 },
> >>>          { 0x0700, 0x00 },
> >>>          { 0x0701, 0x10 },
> >>> @@ -280,12 +306,8 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
> >>>          { 0x0301, 0x05 },
> >>>          { 0x0303, 0x01 },
> >>>          { 0x0305, 0x02 },
> >>> -       { 0x0306, 0x00 },
> >>> -       { 0x0307, 0x78 },
> >>>          { 0x030b, 0x01 },
> >>>          { 0x030d, 0x02 },
> >>> -       { 0x030e, 0x00 },
> >>> -       { 0x030f, 0x4b },
> >>>          { 0x0310, 0x00 },
> >>>          { 0x0700, 0x00 },
> >>>          { 0x0701, 0x10 },
> >>> @@ -329,12 +351,8 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
> >>>          { 0x0301, 0x05 },
> >>>          { 0x0303, 0x01 },
> >>>          { 0x0305, 0x02 },
> >>> -       { 0x0306, 0x00 },
> >>> -       { 0x0307, 0x78 },
> >>>          { 0x030b, 0x01 },
> >>>          { 0x030d, 0x02 },
> >>> -       { 0x030e, 0x00 },
> >>> -       { 0x030f, 0x4b },
> >>>          { 0x0310, 0x00 },
> >>>          { 0x0700, 0x00 },
> >>>          { 0x0701, 0x10 },
> >>> @@ -378,12 +396,8 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
> >>>          { 0x0301, 0x05 },
> >>>          { 0x0303, 0x01 },
> >>>          { 0x0305, 0x02 },
> >>> -       { 0x0306, 0x00 },
> >>> -       { 0x0307, 0x78 },
> >>>          { 0x030b, 0x01 },
> >>>          { 0x030d, 0x02 },
> >>> -       { 0x030e, 0x00 },
> >>> -       { 0x030f, 0x4b },
> >>>          { 0x0310, 0x00 },
> >>>          { 0x0700, 0x00 },
> >>>          { 0x0701, 0x10 },
> >>> @@ -427,12 +441,8 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
> >>>          { 0x0301, 0x05 },
> >>>          { 0x0303, 0x01 },
> >>>          { 0x0305, 0x02 },
> >>> -       { 0x0306, 0x00 },
> >>> -       { 0x0307, 0x78 },
> >>>          { 0x030b, 0x01 },
> >>>          { 0x030d, 0x02 },
> >>> -       { 0x030e, 0x00 },
> >>> -       { 0x030f, 0x4b },
> >>>          { 0x0310, 0x00 },
> >>>          { 0x0700, 0x00 },
> >>>          { 0x0701, 0x10 },
> >>> @@ -476,12 +486,8 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
> >>>          { 0x0301, 0x05 },
> >>>          { 0x0303, 0x01 },
> >>>          { 0x0305, 0x02 },
> >>> -       { 0x0306, 0x00 },
> >>> -       { 0x0307, 0x78 },
> >>>          { 0x030b, 0x01 },
> >>>          { 0x030d, 0x02 },
> >>> -       { 0x030e, 0x00 },
> >>> -       { 0x030f, 0x4b },
> >>>          { 0x0310, 0x00 },
> >>>          { 0x0700, 0x00 },
> >>>          { 0x0701, 0x10 },
> >>> @@ -525,12 +531,8 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
> >>>          { 0x0301, 0x05 },
> >>>          { 0x0303, 0x01 },
> >>>          { 0x0305, 0x02 },
> >>> -       { 0x0306, 0x00 },
> >>> -       { 0x0307, 0x78 },
> >>>          { 0x030b, 0x01 },
> >>>          { 0x030d, 0x02 },
> >>> -       { 0x030e, 0x00 },
> >>> -       { 0x030f, 0x4b },
> >>>          { 0x0310, 0x00 },
> >>>          { 0x0700, 0x00 },
> >>>          { 0x0701, 0x10 },
> >>> @@ -574,12 +576,8 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
> >>>          { 0x0301, 0x05 },
> >>>          { 0x0303, 0x01 },
> >>>          { 0x0305, 0x02 },
> >>> -       { 0x0306, 0x00 },
> >>> -       { 0x0307, 0x78 },
> >>>          { 0x030b, 0x01 },
> >>>          { 0x030d, 0x02 },
> >>> -       { 0x030e, 0x00 },
> >>> -       { 0x030f, 0x4b },
> >>>          { 0x0310, 0x00 },
> >>>          { 0x0700, 0x00 },
> >>>          { 0x0701, 0x10 },
> >>> @@ -623,12 +621,8 @@ static const struct imx355_reg mode_1640x922_regs[] = {
> >>>          { 0x0301, 0x05 },
> >>>          { 0x0303, 0x01 },
> >>>          { 0x0305, 0x02 },
> >>> -       { 0x0306, 0x00 },
> >>> -       { 0x0307, 0x78 },
> >>>          { 0x030b, 0x01 },
> >>>          { 0x030d, 0x02 },
> >>> -       { 0x030e, 0x00 },
> >>> -       { 0x030f, 0x4b },
> >>>          { 0x0310, 0x00 },
> >>>          { 0x0700, 0x00 },
> >>>          { 0x0701, 0x10 },
> >>> @@ -672,12 +666,8 @@ static const struct imx355_reg mode_1300x736_regs[] = {
> >>>          { 0x0301, 0x05 },
> >>>          { 0x0303, 0x01 },
> >>>          { 0x0305, 0x02 },
> >>> -       { 0x0306, 0x00 },
> >>> -       { 0x0307, 0x78 },
> >>>          { 0x030b, 0x01 },
> >>>          { 0x030d, 0x02 },
> >>> -       { 0x030e, 0x00 },
> >>> -       { 0x030f, 0x4b },
> >>>          { 0x0310, 0x00 },
> >>>          { 0x0700, 0x00 },
> >>>          { 0x0701, 0x10 },
> >>> @@ -721,12 +711,8 @@ static const struct imx355_reg mode_1296x736_regs[] = {
> >>>          { 0x0301, 0x05 },
> >>>          { 0x0303, 0x01 },
> >>>          { 0x0305, 0x02 },
> >>> -       { 0x0306, 0x00 },
> >>> -       { 0x0307, 0x78 },
> >>>          { 0x030b, 0x01 },
> >>>          { 0x030d, 0x02 },
> >>> -       { 0x030e, 0x00 },
> >>> -       { 0x030f, 0x4b },
> >>>          { 0x0310, 0x00 },
> >>>          { 0x0700, 0x00 },
> >>>          { 0x0701, 0x10 },
> >>> @@ -770,12 +756,8 @@ static const struct imx355_reg mode_1284x720_regs[] = {
> >>>          { 0x0301, 0x05 },
> >>>          { 0x0303, 0x01 },
> >>>          { 0x0305, 0x02 },
> >>> -       { 0x0306, 0x00 },
> >>> -       { 0x0307, 0x78 },
> >>>          { 0x030b, 0x01 },
> >>>          { 0x030d, 0x02 },
> >>> -       { 0x030e, 0x00 },
> >>> -       { 0x030f, 0x4b },
> >>>          { 0x0310, 0x00 },
> >>>          { 0x0700, 0x00 },
> >>>          { 0x0701, 0x10 },
> >>> @@ -819,12 +801,8 @@ static const struct imx355_reg mode_1280x720_regs[] = {
> >>>          { 0x0301, 0x05 },
> >>>          { 0x0303, 0x01 },
> >>>          { 0x0305, 0x02 },
> >>> -       { 0x0306, 0x00 },
> >>> -       { 0x0307, 0x78 },
> >>>          { 0x030b, 0x01 },
> >>>          { 0x030d, 0x02 },
> >>> -       { 0x030e, 0x00 },
> >>> -       { 0x030f, 0x4b },
> >>>          { 0x0310, 0x00 },
> >>>          { 0x0700, 0x00 },
> >>>          { 0x0701, 0x10 },
> >>> @@ -868,12 +846,8 @@ static const struct imx355_reg mode_820x616_regs[] = {
> >>>          { 0x0301, 0x05 },
> >>>          { 0x0303, 0x01 },
> >>>          { 0x0305, 0x02 },
> >>> -       { 0x0306, 0x00 },
> >>> -       { 0x0307, 0x78 },
> >>>          { 0x030b, 0x01 },
> >>>          { 0x030d, 0x02 },
> >>> -       { 0x030e, 0x00 },
> >>> -       { 0x030f, 0x4b },
> >>>          { 0x0310, 0x00 },
> >>>          { 0x0700, 0x02 },
> >>>          { 0x0701, 0x78 },
> >>> @@ -1422,6 +1396,20 @@ static int imx355_start_streaming(struct imx355 *imx355)
> >>>                  return ret;
> >>>          }
> >>>
> >>> +       /* Set PLL registers for the external clock frequency */
> >>> +       ret = imx355_write_reg(imx355, IMX355_REG_EXTCLK_FREQ, 2,
> >>> +                              imx355->clk_params->extclk_freq);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       ret = imx355_write_reg(imx355, IMX355_REG_PLL_VT_MUL, 2,
> >>> +                              imx355->clk_params->pll_vt_mpy);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +       ret = imx355_write_reg(imx355, IMX355_REG_PLL_OP_MUL, 2,
> >>> +                              imx355->clk_params->pll_op_mpy);
> >>> +       if (ret)
> >>> +               return ret;
> >>> +
> >>>          /* set digital gain control to all color mode */
> >>>          ret = imx355_write_reg(imx355, IMX355_REG_DPGA_USE_GLOBAL_GAIN, 1, 1);
> >>>          if (ret)
> >>> @@ -1749,7 +1737,13 @@ static int imx355_probe(struct i2c_client *client)
> >>>                                       "failed to get clock\n");
> >>>
> >>>          freq = clk_get_rate(imx355->clk);
> >>> -       if (freq != IMX355_EXT_CLK)
> >>> +       for (unsigned int i = 0; i < ARRAY_SIZE(imx355_clk_params); i++) {
> >>> +               if (freq == imx355_clk_params[i].ext_clk) {
> >>> +                       imx355->clk_params = &imx355_clk_params[i];
> >>> +                       break;
> >>> +               }
> >>> +       }
> >>> +       if (!imx355->clk_params)
> >>>                  return dev_err_probe(imx355->dev, -EINVAL,
> >>>                                       "external clock %lu is not supported\n",
> >>>                                       freq);
> >>>
> >>> ---
> >>> base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
> >>> change-id: 20260414-imx355-24mhz-b8ccfab3adfb
> >>>
> >>> Best regards,
> >>> --
> >>> David Heidelberg <david@ixit.cz>
> >>>
> >>>
> >>>
>
> --
> David Heidelberg
>
