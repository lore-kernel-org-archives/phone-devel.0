Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F094399009
	for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 11:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776338828; cv=pass; b=p4EA3+1aOhZWJLUJuXxgLr+SfuIYAslWhKYNcOxSgZy9v2AR/w2RthsUXTC6gLZCKK5Pm3NyeS8Yo/2Gcs5w4JF1+MZkr7Fn353m0RX5RFqLEV8LUcOesqNfPrC+x0xoNBK+jS9ZfSiDfi/ZfhDfp56vTM5I9sG1ZIUHiz9leKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776338828; c=relaxed/simple;
	bh=gFquVQ7BY+Pdvw7kEvd5x/Fsrf6yc3/B0UMIrm+b8y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bW/z69KLtz+KuWYQNiuvqqBnWgTnQEMpgbqs8C9pOzvwYmC+6Eb4YW8d/1Hazhm8QEWZO2VSvFmU+9rzQ/RYgfp1hOGYTZcqg+/oEnesHZtDS4FwWYtyLuKhC24htvP1yMvkJjkAkOjcv5c2fRc+1nCWx8/vr2OtZnRfmJrrMKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=L7h69yPw; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="L7h69yPw"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-794719afcd4so85266877b3.1
        for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 04:27:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776338824; cv=none;
        d=google.com; s=arc-20240605;
        b=Z27wDTWgeOvvywfO3VCn8Yqb+EoNYbXJ1hMj2IgReR5F9TpH7qRu5QbMASG3FUAfeE
         5mYxbDoGUg4Mrg5G+Beq+dRhOezz0c1jKKW2G+4sLPSCAGyHxUf6A1h3QbkBjeRc7+O4
         22IpVd+1oGqMDfVXq+HxyhMZrYxiUmYXd8bD7thME2wBT2JtlNpRxJu6V4dWs2F1ilie
         a6BuQnwnKVEmizqJlKd6gsp7SGoNWHQWIygTptFkgdFrTDajI0JOTlFlmoxu45mcz3M4
         4DzGEkrgUMsttYsYSfQRZYDr2UAY6+7UTUFcSOGEpaUgmO9cIcbt3WROtTFyv/ttw13T
         AY2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HQfsO91AKrbaeL8GA82v9e7A59zDMj47vXIP7rqC+eI=;
        fh=dk31M84AjqyV73uwtFbcl5aQlKYaHUY9lOCFum46/Tk=;
        b=Besmo3fTsfJQFRkzkhZhlWWAislau1usDqBG9RItt8le1T4DFyIev9XH7u2KDGcY9l
         fWc+iuLVK1yn9VwbS3qhSE9jS2O0ULXJdEUXUwDeQUMfEaqQGHp7PLfU0nCZcc0nYp91
         7FxdebpkhkZhk/s69Bg3eG5FntZ5vhPUmByj6CnLZOtU5JAOqSVyv/L2vq9X9dy7kRpc
         DxZ9KHUEx7SVEeB0fstH/UdX0f+AIHoGgNjX0G9Q0TWmYHkfjn7KBBLYgZ47desrBSnd
         HSFnH2kbzyrpTnXEUP3PBmnaq1T9ZoIyZS6xtzW1/PXOWv9W0+l2mPWigJb5TPY3yUaF
         8xKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1776338824; x=1776943624; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HQfsO91AKrbaeL8GA82v9e7A59zDMj47vXIP7rqC+eI=;
        b=L7h69yPwq3ctS8I/g4fr9IJsoQMRbun/w3/rYtXdAfy3akz3li46ech6WKzAjO4W5u
         9j9yQ4hNe393mDIRhB9AwieR0iVwwZ3GzrrvIOpVQX6mrvE7bvcGU1S363DTlpxBbJy9
         Ftlw27DFInwUrYZGHW+kO6AV83Ux0oVMDCuJ/Au2jCEa49rZMYuyeH+AiEh22nnMxZjx
         nkGzbwuTb9SOtFj54/oAuS5L+OXSZNejPkMvmb6cU4LzrAlR8/FYpYu4NTjdyIOQkglR
         JD8prJkRadUTkSnNlakWeYuTl9KG2Uzfm8vofuniOP3plNTVyDyN1su/ZjK8Ljq7mupl
         bEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776338824; x=1776943624;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQfsO91AKrbaeL8GA82v9e7A59zDMj47vXIP7rqC+eI=;
        b=nejzOoeZn6XLsxTnSy2hb6J/5z3xh5ThwSkhLp4oCbBsazLJQdylnqwDe7zT7+YFHr
         OOmrZm59FjzLvy0tf08IBosC3aPZ9d4ra8i7++okL7y+uO//1qBrIqtcMcZWtiqLyW4K
         ykNOQXPSzzurC5WHp7LeoqJ/ysQ6Mu/NSDJBaLDmhWiw2fsReHb8VYGbtTg7PfoSVCpt
         YxxJx7d7CdQ5p0qMW3Jb/tFP63uYNkS3QjcwJxIpROQRe7Fw+E+CMBasmNCrxk+/wf7b
         5B4n4RAWG3EXXdqRpLJDH2W1vIV0hliqRqVS9vfch4gw1VrUqGG5cZyPKHPpkr9hsR3K
         PI2w==
X-Forwarded-Encrypted: i=1; AFNElJ8qqaXpybelzTlBFCx2cKiHnWrqcN2qMCJW8LmxGyFAP+aXfN9EKLLEW5A1q2kQXRSpcXk8mHdX+q7Myw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf7WMlOQtsxPNc0+E6jJMQw0buabw39H2NJ2Wqa+Gp2rl0ICzO
	4Di1oLDv+FtPm8lPE5ehIbCNCHkP5lx+ChrcQekdIyNeYOB3paiWgKtXhGIoaV16B+Z7hTITDOi
	lp6RydahfEGUN1CeVDLLvV8i8gR7BJhQopmSMpVtLKw==
X-Gm-Gg: AeBDievsZ42CGMhiME1ETfRrmQrnezNeN8A85hedeLfHalsGoNsrQD4PM/4iMFD/c+z
	N4telw6oWfaMA49hEw9xVwYYU2iLQuz96QKlvjDa8menIy7NqNcGjAM8isgmnbMJ5ZvDas82Uf2
	scE71JyZ9kkGlEMSFIXrA64h05nK/CoXaOStjvizRJGmi4sC1pn5lnkxlFjchOwDb1/NYd9E0HY
	CPj14p1BZzG9ArgvBfYxdWGEX8dKRsKJr4HpvxxcifXQNuNw3bZ/G6U9LpIM2iGnMSKkcXfwj2C
	2UnT+a3bMMxewXTuFpoFk0ea/FbegL0rP7OhBH/G3Xhd0R1MQw==
X-Received: by 2002:a05:690c:7304:b0:7b7:5f48:d9a8 with SMTP id
 00721157ae682-7b75f49cf9cmr60116297b3.43.1776338824314; Thu, 16 Apr 2026
 04:27:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz>
In-Reply-To: <20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 16 Apr 2026 12:26:47 +0100
X-Gm-Features: AQROBzBpLXrQJRyJwHzbLyP5HOBvY274hRPHkzedrnw2qvxji5dX49Oa7ZDyLCg
Message-ID: <CAPY8ntBrQaSn8bvw76qW1MF1=xcA+5u3XVvhGwO9AOO1nONu=Q@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx355: Add support for 24 MHz external clock
To: david@ixit.cz
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Richard Acayan <mailingradian@gmail.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi David

On Tue, 14 Apr 2026 at 11:17, David Heidelberg via B4 Relay
<devnull+david.ixit.cz@kernel.org> wrote:
>
> From: David Heidelberg <david@ixit.cz>
>
> The IMX355 sensor supports multiple external clock frequencies,
> including 19.2 MHz and 24 MHz. The driver currently supports only
> fixed 19.2 MHz input clock.
>
> Refactor the clock handling to make the PLL configuration dependent
> on the external clock frequency and add support for 24 MHz. Introduce
> a table of clock parameter sets and program the corresponding EXTCLK
> frequency and PLL multipliers to maintain consistent internal VCO
> frequencies across supported inputs.
>
> The PLL settings are adjusted so that:
>   - VT VCO remains at 1152 MHz
>   - OP VCO remains at 720 MHz
>
> This preserves existing timing characteristics while allowing systems
> using a 24 MHz clock to operate correctly.

I happened to have someone asking for this same requirement, so tried
out your patch.

I don't have a datasheet for IMX355, but the patterns very closely
follow IMX477 and IMX708 for which I do.
Those both have a single PLL and a dual PLL mode selected via register
PLL_MULT_DRIV (0x0310). The imx355 driver is setting that to 0 for
single PLL mode, which means that the PREDIV_IVT (0x0305) and MPY_IVT
PLL (0x0306/7) settings do nothing as the IVT block is driven from
IOPCK.

Your patch therefore works, but does more than is necessary - you
really can set pll_vt_mpy to any value and it works exactly the same.
I guess changing the unconnected IVTCK clock within the sensor could
feasibly change EMC emissions, but that feels pretty unlikely.
Possibly add a comment to your existing comment of "VT VCO = 1152 MHz"
to say that it's unused to avoid others going down the rabbit hole I
encountered.

(For those referencing the other datasheets, the description for
single PLL mode lists configuring IVT_PREPLLCK_DIV and IVT_PLL_MPY,
but the diagram shows that IOP is always driven from IOPCK, and IVT is
muxed between IOPCK and IVTCK)

> No functional change for existing 19.2 MHz users.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: David Heidelberg <david@ixit.cz>

Whilst useful comments could be added, it does what it says and works:

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
> Known users: Pixel 3 and 3a.
> ---
>  drivers/media/i2c/imx355.c | 114 +++++++++++++++++++++------------------------
>  1 file changed, 54 insertions(+), 60 deletions(-)
>
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 27a5c212a527f..f9ec13bb27d10 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -25,6 +25,11 @@
>  #define IMX355_REG_CHIP_ID             0x0016
>  #define IMX355_CHIP_ID                 0x0355
>
> +/* PLL registers that depend on the external clock frequency */
> +#define IMX355_REG_EXTCLK_FREQ         0x0136
> +#define IMX355_REG_PLL_VT_MUL          0x0306
> +#define IMX355_REG_PLL_OP_MUL          0x030e
> +
>  /* V_TIMING internal */
>  #define IMX355_REG_FLL                 0x0340
>  #define IMX355_FLL_MAX                 0xffff
> @@ -63,7 +68,6 @@
>
>  /* default link frequency and external clock */
>  #define IMX355_LINK_FREQ_DEFAULT       360000000LL
> -#define IMX355_EXT_CLK                 19200000
>  #define IMX355_LINK_FREQ_INDEX         0
>
>  /* number of data lanes */
> @@ -100,6 +104,33 @@ struct imx355_mode {
>         struct imx355_reg_list reg_list;
>  };
>
> +struct imx355_clk_params {
> +       u32 ext_clk;
> +       u16 extclk_freq; /* External clock (MHz) in 8.8 fixed point) */
> +       u16 pll_vt_mpy; /* VT system PLL multiplier */
> +       u16 pll_op_mpy; /* OP system PLL multiplier */
> +};
> +
> +/*
> + * All modes use the same PLL dividers (PREPLLCK_VT_DIV=2, PREPLLCK_OP_DIV=2),
> + * so the multipliers are adjusted to produce the same VCO frequencies:
> + *   VT VCO = 1152 MHz, OP VCO = 720 MHz
> + */
> +static const struct imx355_clk_params imx355_clk_params[] = {
> +       {
> +               .ext_clk = 19200000,
> +               .extclk_freq = 0x1333,  /* 19.2 MHz */
> +               .pll_vt_mpy = 120,      /* 19.2 / 2 * 120 = 1152 MHz */
> +               .pll_op_mpy = 75,       /* 19.2 / 2 * 75  = 720 MHz */
> +       },
> +       {
> +               .ext_clk = 24000000,
> +               .extclk_freq = 0x1800,  /* 24.0 MHz */
> +               .pll_vt_mpy = 96,       /* 24.0 / 2 * 96  = 1152 MHz */
> +               .pll_op_mpy = 60,       /* 24.0 / 2 * 60  = 720 MHz */
> +       },
> +};
> +
>  struct imx355_hwcfg {
>         unsigned long link_freq_bitmap;
>  };
> @@ -125,6 +156,7 @@ struct imx355 {
>         const struct imx355_mode *cur_mode;
>
>         struct imx355_hwcfg *hwcfg;
> +       const struct imx355_clk_params *clk_params;
>
>         /*
>          * Mutex for serialized access:
> @@ -144,8 +176,6 @@ static const struct regulator_bulk_data imx355_supplies[] = {
>  };
>
>  static const struct imx355_reg imx355_global_regs[] = {
> -       { 0x0136, 0x13 },
> -       { 0x0137, 0x33 },
>         { 0x304e, 0x03 },
>         { 0x4348, 0x16 },
>         { 0x4350, 0x19 },
> @@ -231,12 +261,8 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
>         { 0x0301, 0x05 },
>         { 0x0303, 0x01 },
>         { 0x0305, 0x02 },
> -       { 0x0306, 0x00 },
> -       { 0x0307, 0x78 },
>         { 0x030b, 0x01 },
>         { 0x030d, 0x02 },
> -       { 0x030e, 0x00 },
> -       { 0x030f, 0x4b },
>         { 0x0310, 0x00 },
>         { 0x0700, 0x00 },
>         { 0x0701, 0x10 },
> @@ -280,12 +306,8 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
>         { 0x0301, 0x05 },
>         { 0x0303, 0x01 },
>         { 0x0305, 0x02 },
> -       { 0x0306, 0x00 },
> -       { 0x0307, 0x78 },
>         { 0x030b, 0x01 },
>         { 0x030d, 0x02 },
> -       { 0x030e, 0x00 },
> -       { 0x030f, 0x4b },
>         { 0x0310, 0x00 },
>         { 0x0700, 0x00 },
>         { 0x0701, 0x10 },
> @@ -329,12 +351,8 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
>         { 0x0301, 0x05 },
>         { 0x0303, 0x01 },
>         { 0x0305, 0x02 },
> -       { 0x0306, 0x00 },
> -       { 0x0307, 0x78 },
>         { 0x030b, 0x01 },
>         { 0x030d, 0x02 },
> -       { 0x030e, 0x00 },
> -       { 0x030f, 0x4b },
>         { 0x0310, 0x00 },
>         { 0x0700, 0x00 },
>         { 0x0701, 0x10 },
> @@ -378,12 +396,8 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
>         { 0x0301, 0x05 },
>         { 0x0303, 0x01 },
>         { 0x0305, 0x02 },
> -       { 0x0306, 0x00 },
> -       { 0x0307, 0x78 },
>         { 0x030b, 0x01 },
>         { 0x030d, 0x02 },
> -       { 0x030e, 0x00 },
> -       { 0x030f, 0x4b },
>         { 0x0310, 0x00 },
>         { 0x0700, 0x00 },
>         { 0x0701, 0x10 },
> @@ -427,12 +441,8 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
>         { 0x0301, 0x05 },
>         { 0x0303, 0x01 },
>         { 0x0305, 0x02 },
> -       { 0x0306, 0x00 },
> -       { 0x0307, 0x78 },
>         { 0x030b, 0x01 },
>         { 0x030d, 0x02 },
> -       { 0x030e, 0x00 },
> -       { 0x030f, 0x4b },
>         { 0x0310, 0x00 },
>         { 0x0700, 0x00 },
>         { 0x0701, 0x10 },
> @@ -476,12 +486,8 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
>         { 0x0301, 0x05 },
>         { 0x0303, 0x01 },
>         { 0x0305, 0x02 },
> -       { 0x0306, 0x00 },
> -       { 0x0307, 0x78 },
>         { 0x030b, 0x01 },
>         { 0x030d, 0x02 },
> -       { 0x030e, 0x00 },
> -       { 0x030f, 0x4b },
>         { 0x0310, 0x00 },
>         { 0x0700, 0x00 },
>         { 0x0701, 0x10 },
> @@ -525,12 +531,8 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
>         { 0x0301, 0x05 },
>         { 0x0303, 0x01 },
>         { 0x0305, 0x02 },
> -       { 0x0306, 0x00 },
> -       { 0x0307, 0x78 },
>         { 0x030b, 0x01 },
>         { 0x030d, 0x02 },
> -       { 0x030e, 0x00 },
> -       { 0x030f, 0x4b },
>         { 0x0310, 0x00 },
>         { 0x0700, 0x00 },
>         { 0x0701, 0x10 },
> @@ -574,12 +576,8 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
>         { 0x0301, 0x05 },
>         { 0x0303, 0x01 },
>         { 0x0305, 0x02 },
> -       { 0x0306, 0x00 },
> -       { 0x0307, 0x78 },
>         { 0x030b, 0x01 },
>         { 0x030d, 0x02 },
> -       { 0x030e, 0x00 },
> -       { 0x030f, 0x4b },
>         { 0x0310, 0x00 },
>         { 0x0700, 0x00 },
>         { 0x0701, 0x10 },
> @@ -623,12 +621,8 @@ static const struct imx355_reg mode_1640x922_regs[] = {
>         { 0x0301, 0x05 },
>         { 0x0303, 0x01 },
>         { 0x0305, 0x02 },
> -       { 0x0306, 0x00 },
> -       { 0x0307, 0x78 },
>         { 0x030b, 0x01 },
>         { 0x030d, 0x02 },
> -       { 0x030e, 0x00 },
> -       { 0x030f, 0x4b },
>         { 0x0310, 0x00 },
>         { 0x0700, 0x00 },
>         { 0x0701, 0x10 },
> @@ -672,12 +666,8 @@ static const struct imx355_reg mode_1300x736_regs[] = {
>         { 0x0301, 0x05 },
>         { 0x0303, 0x01 },
>         { 0x0305, 0x02 },
> -       { 0x0306, 0x00 },
> -       { 0x0307, 0x78 },
>         { 0x030b, 0x01 },
>         { 0x030d, 0x02 },
> -       { 0x030e, 0x00 },
> -       { 0x030f, 0x4b },
>         { 0x0310, 0x00 },
>         { 0x0700, 0x00 },
>         { 0x0701, 0x10 },
> @@ -721,12 +711,8 @@ static const struct imx355_reg mode_1296x736_regs[] = {
>         { 0x0301, 0x05 },
>         { 0x0303, 0x01 },
>         { 0x0305, 0x02 },
> -       { 0x0306, 0x00 },
> -       { 0x0307, 0x78 },
>         { 0x030b, 0x01 },
>         { 0x030d, 0x02 },
> -       { 0x030e, 0x00 },
> -       { 0x030f, 0x4b },
>         { 0x0310, 0x00 },
>         { 0x0700, 0x00 },
>         { 0x0701, 0x10 },
> @@ -770,12 +756,8 @@ static const struct imx355_reg mode_1284x720_regs[] = {
>         { 0x0301, 0x05 },
>         { 0x0303, 0x01 },
>         { 0x0305, 0x02 },
> -       { 0x0306, 0x00 },
> -       { 0x0307, 0x78 },
>         { 0x030b, 0x01 },
>         { 0x030d, 0x02 },
> -       { 0x030e, 0x00 },
> -       { 0x030f, 0x4b },
>         { 0x0310, 0x00 },
>         { 0x0700, 0x00 },
>         { 0x0701, 0x10 },
> @@ -819,12 +801,8 @@ static const struct imx355_reg mode_1280x720_regs[] = {
>         { 0x0301, 0x05 },
>         { 0x0303, 0x01 },
>         { 0x0305, 0x02 },
> -       { 0x0306, 0x00 },
> -       { 0x0307, 0x78 },
>         { 0x030b, 0x01 },
>         { 0x030d, 0x02 },
> -       { 0x030e, 0x00 },
> -       { 0x030f, 0x4b },
>         { 0x0310, 0x00 },
>         { 0x0700, 0x00 },
>         { 0x0701, 0x10 },
> @@ -868,12 +846,8 @@ static const struct imx355_reg mode_820x616_regs[] = {
>         { 0x0301, 0x05 },
>         { 0x0303, 0x01 },
>         { 0x0305, 0x02 },
> -       { 0x0306, 0x00 },
> -       { 0x0307, 0x78 },
>         { 0x030b, 0x01 },
>         { 0x030d, 0x02 },
> -       { 0x030e, 0x00 },
> -       { 0x030f, 0x4b },
>         { 0x0310, 0x00 },
>         { 0x0700, 0x02 },
>         { 0x0701, 0x78 },
> @@ -1422,6 +1396,20 @@ static int imx355_start_streaming(struct imx355 *imx355)
>                 return ret;
>         }
>
> +       /* Set PLL registers for the external clock frequency */
> +       ret = imx355_write_reg(imx355, IMX355_REG_EXTCLK_FREQ, 2,
> +                              imx355->clk_params->extclk_freq);
> +       if (ret)
> +               return ret;
> +       ret = imx355_write_reg(imx355, IMX355_REG_PLL_VT_MUL, 2,
> +                              imx355->clk_params->pll_vt_mpy);
> +       if (ret)
> +               return ret;
> +       ret = imx355_write_reg(imx355, IMX355_REG_PLL_OP_MUL, 2,
> +                              imx355->clk_params->pll_op_mpy);
> +       if (ret)
> +               return ret;
> +
>         /* set digital gain control to all color mode */
>         ret = imx355_write_reg(imx355, IMX355_REG_DPGA_USE_GLOBAL_GAIN, 1, 1);
>         if (ret)
> @@ -1749,7 +1737,13 @@ static int imx355_probe(struct i2c_client *client)
>                                      "failed to get clock\n");
>
>         freq = clk_get_rate(imx355->clk);
> -       if (freq != IMX355_EXT_CLK)
> +       for (unsigned int i = 0; i < ARRAY_SIZE(imx355_clk_params); i++) {
> +               if (freq == imx355_clk_params[i].ext_clk) {
> +                       imx355->clk_params = &imx355_clk_params[i];
> +                       break;
> +               }
> +       }
> +       if (!imx355->clk_params)
>                 return dev_err_probe(imx355->dev, -EINVAL,
>                                      "external clock %lu is not supported\n",
>                                      freq);
>
> ---
> base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
> change-id: 20260414-imx355-24mhz-b8ccfab3adfb
>
> Best regards,
> --
> David Heidelberg <david@ixit.cz>
>
>
>
