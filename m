Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795640624;
	b=GxpiMAZluubpuveYn0otxMCUkIFrAsJ1iNDpGyCRYMxqIDoCFGk8tQ/adXVvLScvBElV
	 ddhobFsL5xBSIlRCnMsHLesRYMmYVEcBnCSo7U8dujHBMhf9XqJ1EgKIEW/4OsS83emXN
	 3vA15z3gan7yaNy5x0saqZQLKk5GrY2buhbvF9p9ejyXueLYMFRmDc87AjMX22xJnxxJp
	 NJ9rEGyJd1ju1GFNI7ElwIXvKM4Cimg1DU7S5QmEfO0DQ6g22qjVVS32czqChduM8zIvM
	 40BB2kAfjZigTnDWlETxsAwnn4GMj1or7eSscEgLYgkmf27vr9Ca6WLrBShMkEs5+Ug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=g8oo3n3BAcC5n/86IJAMCc4c54L34G0M24e5RFRNyIo=;
	b=JOAqUAJOoneVkVCirbWqUaY9BwmFb8nzxaW3aPNcmPnPBKLFDqUxaOIXK3CRKIqrFLrR
	 o+89fCxcsrFUj44cu/d2KudNJrvE0MI385pmbo6GrKt8p83lforESeptKqjM4kHaHxNKo
	 JoGl32Mvlh+cypCFOqKegLliXFWCdRDbKO1Rqg/gh7i+CsZaN2PMbhpdpp6Oc8jOo5fQc
	 IfapwXbFeIIPSPzIIPrylIto6GtfWbzVvwVOPr0X2LpRrtSujqzBEtDyCCbjEIXQebGFn
	 Ucmt2r2086YqPk29E0Lcjx+mJ28hI9kW4GfXNSlRRWHPg/IidoFztcNRPo+3jzgVdMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KJxP04gc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E94606A326
	for <phone-devel@vger.kernel.org>; Wed, 25 Nov 2026 21:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05E94606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KJxP04gc
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6bab377105dso4919473a12.1
        for <phone-devel@vger.kernel.org>; Wed, 25 Nov 2026 13:03:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795640622; cv=none;
        d=google.com; s=arc-20260327;
        b=kSEhGkwOyjdgGMPgvE9LX9NFX+nIn6CHUD71J4jCt0tEjuBpUSC69nf/UN9BIZBpm7
         E0b2PTP8sfh4hbpbkycfP6EjM3Ck5fq2zxe2MU7g48dD5rezOyd8EekVK9zeGVbj0RVh
         EHovx8P6STqHILo2fOfCG/lwfXY3LzJP/x9zIHUksN8hcNIjHpg7j3x5Fo+oE++/k1M0
         O/0wNgsh8xCAw9JTiMTvyNOcJqNS0vWBlHD6yyfHyZlmjnaJBW6jH6Oa+mPkuc+nrJ9c
         1KCTSS2gNpY5MX1QffT4gcoV6fJISP9lRWsDkOkWiYTL0hJvvWEA0bXXb9FL+J/myfI/
         JXTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g8oo3n3BAcC5n/86IJAMCc4c54L34G0M24e5RFRNyIo=;
        fh=p6hjfzjq2A58TQXSFjkuKSiMLnZTSSmciEL+net+/Uw=;
        b=CqIoPx9vM/ERcb8H7569Mk4ZlefiJdRHwZG4a4cd9W/hDAsCBfPJbjhzuoEff6KF0W
         GcmZkaBSBHHFU8NFOUPQ3E54Ld+OMTd/bDo/DWPQElhVgSACtpnG6FSz6JC4WC0c6KVf
         TNavkBYtT5YhAWng+NJRZss7GAITK3j+9gO/KZ8Z3CEh8zTj7xdVM7to1AT1ABu4xPyu
         O2eRSfiGon7kJZIQP0H+ESdLUb0VieymzmT2QzKIn27XSIbVzIzgseAE6oxD+Q3fATPJ
         EERmw5d6ziwgYcuggTUuMm1AGsMQDD995rJwKbYoc8gPsADH6T2iijMrmv5eAcNZOZTY
         BZQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795640622; x=1796245422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g8oo3n3BAcC5n/86IJAMCc4c54L34G0M24e5RFRNyIo=;
        b=KJxP04gcKtvhl2b2pLBHyg1LEE4rRCKNaHs8wlXVREzQ+Zgu+evjqb5AUqAab64UJh
         db0W1kX71KE9nNRRZX3Xb++Qtek17wOBcwiVnOg4NE6rd1DQWssOuyTErQyHq5fuCw8r
         LypcJ1lOj0zWJ5nW4f98vJyu1x2pycn6bV950NfnNDUUP+wnxSGy8kwkgf2DDpsT24iC
         FQ/oEv7Updo9niFGvDDtU5Pvh9LH8S4adbuY91mFnYcrYDmWajgDQYbmcF3jT6tn7MfA
         nUieK7bae64w4hGfVOAWaVmyMKDvQDNX9eRdqDyAcvpQvPwox2+9a90FZEy7Wff+rl9B
         6Kuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640622; x=1796245422;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g8oo3n3BAcC5n/86IJAMCc4c54L34G0M24e5RFRNyIo=;
        b=lJh0CIMAutGhvH+xKuB4OBMEDfuQGca9LutepCHv/Z8KNgBjsXgtbEtogHf2sSzpCw
         RPj7POXXmjIWXTh2OU9fkHv6zth9MsEhaCB49O3fQqAH1EpZWUAbMwsGLDBjBfuSb3yn
         9RNEUMNSkmWyTuEqmVPgVeQ9MTttzlPGCprR9cYyt2qynI/dPdwRaXSFeVy/PVsM67oG
         zxAD9U0Y1R7ONSRznccHEaYEQr4W13ChNc4hrnk0wea2P7PIOF987F8MT3KF8SeF4sut
         KT1+5C/ufA1Ww58Y7dgi80Do6qrzGWMpx92ztZnO9NNJMog6xXtBP4r0mEgRnMUwP68F
         LWaw==
X-Forwarded-Encrypted: i=1; AL+hErHzHiOI65lOFFYzi6jjSB0rZm4Y+wRhYGT3icFM/mDOh/VBj0nHyCElpK8uUTPWg/kiUAoZbgBYSlCufg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ay4ifkdDPywh2dAFOs68WTu0x80pdm1fI2ocfplqZ4lOmT4FW
	AZQo7Fi8Py+y9/UGj//bW/SO51ShFKzju0D0S0JUZwvI75fAux6qDwKFcbV4mnRqy3Tpg+H0Fjm
	PnEs0Rh/r+Wp+R+z+8kmBBz5hBKaI0ltotI3xW9LzZA==
X-Gm-Gg: AZFdTZc8/m+xRy1ML1tepTuXZKClSn/qnVk2HEBWvlLO18LM9ZqAq6epO9R1Ay8Onqb
	j2PhzsJmPhA/IDgGpnRYdpWxbYMbPqQsLMUbwzMJktn/axiI3lLyszIVY8R1v9i3FSaOMM5+gD1
	pAKVp1QNo9fZYKrtTah4R8YekIIAtMAOiGCtumOuJxe7zrQjZVmdmoBm/7m7CRwh+A2S4TAZwmy
	/SuNIli+Wlp3QwStqScWkYFl17QZQfdidahocspob4eAipgMR8X4e6H8tHEDNxBsLBvxcRRfG9H
	+2ORn6uBg+XZUFtSCpE8u52Ggp3zBIJI6uf7grGbTWNHP5jPqH02yL7JEldW3Epu2RW8p7s0+F5
	ZkkGGclIcqrW2yaTr6kEpFMsBW71kpT4QFSBfWl7B80zV+DT0Hh9oZhNDZ9LLDGJbnFwA0Ps=
X-Received: by 2002:aa7:df18:0:b0:6b9:c43d:88f with SMTP id
 4fb4d7f45d1cf-6ba37d5c69dmr10748147a12.9.1795640622317; Wed, 25 Nov 2026
 13:03:42 -0800 (PST)
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-gs101-usb-phy-orientation-v2-0-3361fa5f7543@linaro.org> <20261123-gs101-usb-phy-orientation-v2-1-3361fa5f7543@linaro.org>
In-Reply-To: <20261123-gs101-usb-phy-orientation-v2-1-3361fa5f7543@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 25 Nov 2026 21:03:29 +0000
X-Gm-Features: Aa3M54pP550miJl9HbCRj99JxEMj3d0cMVlh26LqNCl_O0LJ7lYFwSv6xfFKFjY
Message-ID: <CADrjBPpm8OzJTG4J8TqWZF-f_qdOKXJ4Tk-LYhNH1D=mWPNNUQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] phy: exynos5-usbdrd: gs101: re-init PIPE3 on
 orientation change
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, RD Babiera <rdbabiera@google.com>, 
	Juan Yescas <jyescas@google.com>, kernel-team@android.com, phone-devel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 23 Nov 2026 at 14:25, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> The SS lane mux on gs101 is programmed only when the PIPE3 phy is
> initialized, based on the Type-C orientation known at that time.
> The orientation switch callback just stores the new orientation and
> relies on the USB controller to exit and re-initialize the phy, which
> only happens if DWC3 enters runtime suspend.
>
> If a cable is connected during boot, the phy is initialized before the
> TCPC reports the orientation (e.g. ~4.0s vs. ~5.3s on Pixel 6), so the
> lanes are programmed for TYPEC_ORIENTATION_NONE, i.e. as if reversed.
> DWC3 doesn't runtime suspend while the cable stays connected (and
> runtime PM is forbidden by default anyway), so the phy is never
> re-initialized and the link comes up in high-speed only.
>
> Re-run the PIPE3 init from the orientation switch callback if the
> PIPE3 phy is initialized and its lanes are programmed for the other
> orientation. Rewriting the lane mux registers alone isn't sufficient,
> the link still comes up in high-speed only with that. Re-initialize
> before signalling VBUS valid, so that DWC3 only sees VBUS once the
> lanes are right. A failure is only logged, so that the TCPM still
> configures the USB role.
>
> Mark the PIPE3 phy as initialized in the same critical section that
> programs the lanes, so that an orientation change can't get lost in
> between.
>
> Also stop storing TYPEC_ORIENTATION_NONE on unplug, so that the stored
> orientation always describes the lanes: while the PIPE3 phy is
> initialized, they stay programmed for it, and when the phy is
> initialized again after phy_exit(), which gates its power, they are
> programmed from it. This avoids re-initializing the PIPE3 phy when a
> cable is plugged in again in the same orientation and the phy stayed
> initialized.
>
> Cc: <stable@vger.kernel.org> # 6.15.x: 2ef1e78ef722: phy: samsung: usbdrd=
: propagate GS101 PIPE3 lock failures
> Cc: <stable@vger.kernel.org> # 6.15.x
> Fixes: 09dc674295a3 ("phy: exynos5-usbdrd: subscribe to orientation notif=
ier if required")
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 61 ++++++++++++++++++++++++++=
++++--
>  1 file changed, 58 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsu=
ng/phy-exynos5-usbdrd.c
> index 2186b745d58f..ccaf0f27c4c8 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -509,6 +509,7 @@ struct exynos5_usbdrd_phy_drvdata {
>   * @regulators: regulators for phy
>   * @sw: TypeC orientation switch handle
>   * @orientation: TypeC connector orientation - normal or flipped
> + * @pipe3_initialized: gs101 PIPE3 phy is initialized (and not isolated)
>   */
>  struct exynos5_usbdrd_phy {
>         struct device *dev;
> @@ -532,6 +533,7 @@ struct exynos5_usbdrd_phy {
>
>         struct typec_switch_dev *sw;
>         enum typec_orientation orientation;
> +       bool pipe3_initialized;
>  };
>
>  static inline
> @@ -1713,6 +1715,8 @@ static int exynos5_usbdrd_gs101_pipe3_init(struct e=
xynos5_usbdrd_phy *phy_drd)
>         u32 reg;
>         int ret;
>
> +       lockdep_assert_held(&phy_drd->phy_mutex);
> +
>         exynos5_usbdrd_usbdp_g2_v4_ctrl_pma_ready(phy_drd);
>
>         /* force aux off */
> @@ -1737,7 +1741,17 @@ static int exynos5_usbdrd_gs101_pipe3_init(struct =
exynos5_usbdrd_phy *phy_drd)
>         if (ret)
>                 return ret;
>
> -       return exynos5_usbdrd_usbdp_g2_v4_pma_check_cdr_lock(phy_drd);
> +       ret =3D exynos5_usbdrd_usbdp_g2_v4_pma_check_cdr_lock(phy_drd);
> +       if (ret)
> +               return ret;
> +
> +       /*
> +        * Set this while still holding phy_mutex, so that the orientatio=
n
> +        * switch callback can't miss an orientation change.
> +        */
> +       phy_drd->pipe3_initialized =3D true;
> +
> +       return 0;
>  }
>
>  static int exynos5_usbdrd_gs101_phy_init(struct phy *phy)
> @@ -1783,6 +1797,9 @@ static int exynos5_usbdrd_gs101_phy_exit(struct phy=
 *phy)
>                 ret =3D exynos850_usbdrd_phy_exit(phy);
>                 if (ret)
>                         return ret;
> +       } else {
> +               scoped_guard(mutex, &phy_drd->phy_mutex)
> +                       phy_drd->pipe3_initialized =3D false;
>         }
>
>         exynos5_usbdrd_phy_isol(inst, true);
> @@ -1880,8 +1897,48 @@ static int exynos5_usbdrd_orien_sw_set(struct type=
c_switch_dev *sw,
>
>         scoped_guard(mutex, &phy_drd->phy_mutex) {
>                 void __iomem * const regs_base =3D phy_drd->reg_phy;
> +               bool reinit_pipe3 =3D false;
>                 unsigned int reg;
>
> +               /*
> +                * The SS lanes are configured during PIPE3 init, for
> +                * TYPEC_ORIENTATION_NORMAL or else as reversed. If the P=
IPE3
> +                * phy is initialized already (e.g. the orientation is on=
ly
> +                * known after the USB controller probed) and the lanes h=
ave
> +                * to change, initialize it again, before signalling VBUS=
 valid
> +                * to the controller. Rewriting the lane mux alone isn't =
enough
> +                * for the SS link to come up.
> +                *
> +                * TYPEC_ORIENTATION_NONE (unplug) isn't stored: while th=
e PIPE3
> +                * phy is initialized, phy_drd->orientation is what the l=
anes are
> +                * programmed for, otherwise it is what the next PIPE3 in=
it will
> +                * program.
> +                *
> +                * Don't return an error, so that the Type-C port manager=
 still
> +                * configures the USB role.
> +                */
> +               if (orientation !=3D TYPEC_ORIENTATION_NONE) {
> +                       bool was_normal =3D (phy_drd->orientation =3D=3D
> +                                          TYPEC_ORIENTATION_NORMAL);
> +                       bool is_normal =3D (orientation =3D=3D
> +                                         TYPEC_ORIENTATION_NORMAL);
> +
> +                       reinit_pipe3 =3D (phy_drd->pipe3_initialized &&
> +                                       is_normal !=3D was_normal);
> +                       phy_drd->orientation =3D orientation;
> +               }
> +
> +               if (reinit_pipe3) {
> +                       const struct exynos5_usbdrd_phy_config *cfg =3D
> +                               phy_drd->phys[EXYNOS5_DRDPHY_PIPE3].phy_c=
fg;
> +
> +                       ret =3D cfg->phy_init(phy_drd);
> +                       if (ret)
> +                               dev_warn(phy_drd->dev,
> +                                        "Failed to reconfigure SS lanes:=
 %d\n",
> +                                        ret);
> +               }
> +
>                 if (orientation =3D=3D TYPEC_ORIENTATION_NONE) {
>                         reg =3D readl(regs_base + EXYNOS850_DRD_UTMI);
>                         reg &=3D ~(UTMI_FORCE_VBUSVALID | UTMI_FORCE_BVAL=
ID);
> @@ -1900,8 +1957,6 @@ static int exynos5_usbdrd_orien_sw_set(struct typec=
_switch_dev *sw,
>                         reg |=3D HSP_VBUSVLDEXTSEL | HSP_VBUSVLDEXT;
>                         writel(reg, regs_base + EXYNOS850_DRD_HSP);
>                 }
> -
> -               phy_drd->orientation =3D orientation;
>         }
>
>         clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->cl=
ks);
>
> --
> 2.56.1.750.gf70dc682cf-goog
>
