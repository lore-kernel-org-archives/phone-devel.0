Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795640665;
	b=cFANUBEFjjY5PvmgLihEuCS2H/dF1h4zTYdKJt56SF2qxaJGzo7/EXyQGkgNAnAXQwX3
	 BHKbzoTLomx36fPBbS3RSXsjrHYEvEiRx9tbDOQ8TR0q1/A+rw2aAjUayzVpQCLT9booj
	 Umnjq43VXchikL8DdFMkNOXU/k9UG8wkjY96kCxPJEk5SlZOc3qrNb15Wka5he6YLXEiC
	 2HxVWYhUzQwggOLc7k9YoSzYAujFZB4kfzCSBKsAOcUYcxpLea9u5jPkYZXY0iQ0sLK4F
	 akgSRJGDXgP+aOKD430QbajDDmWpMJMxucEChf/aFDeu42smMhfHrcg0cfbnGzUgOfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jAVSepPFXDVnDs0KIr6D847y94ZRdB5eQ9a+FnzieW4=;
	b=iFin/qO3WUfE89Kikvx293WhDFB0S0PD41SG2qtlcWrUf35aWrmCR59U/4PkJvCieE22
	 MYl7Jm924ND2VgC6mtBStxlZMgM0BiHS2tLuapi40K7W2Q/S1GfD9Pd6UHn2zt7iioNjo
	 T3l09aCre9gt7ESIz/2h6Eo9jNVNgHHjxnlX5ZVDA8/96r9igar6g+RuoxXxrifVrZK6h
	 yYEYPgpCmsRrxWPD/TvWsZ0g3RECFbnekG/X5pWzTuZbkEMpkPHAX2dV6poB0JSLCt0DE
	 tXwDUw6lOVnNEcbd+eezkISWV+fzh66JqnJptiLM19h3kqcPgPr7VFbfCPnGdvGtYbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tCCn15NC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345AB606A321
	for <phone-devel@vger.kernel.org>; Wed, 25 Nov 2026 21:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 345AB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tCCn15NC
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6bab377105dso4920253a12.1
        for <phone-devel@vger.kernel.org>; Wed, 25 Nov 2026 13:04:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795640664; cv=none;
        d=google.com; s=arc-20260327;
        b=ST9Wf6dLLWz4dHP9iYcgqK1AU9+Trmo5znePj9cXYeN9e6tyUrPCLvfmSQ0NZQ7OKA
         dHdosbkFsq5UOCLJBkrxZ69oC0kKwTUsR6UdLfUwEZ5eKFwAATMiibs0j1fS6chjJxly
         mbCnJq/4y7BoUpYRXmrSocsZtu4nWLH9D4bWvnXAIvgzxIywl2KbXgGK2MqmvteXa3NP
         3LHmOPTiEw/t8FLkSdwkaJJ6FisSLuSqf/3Au554FfNDNDofbk1u1a6o+GBjeQpagCbm
         mlH8Fy9tECkta8j4TeIpwMEHAsQCi7PPb2NzqJi2+0NeIHekA2hfpS8DvOWbLw5AWlr7
         8QyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jAVSepPFXDVnDs0KIr6D847y94ZRdB5eQ9a+FnzieW4=;
        fh=ZXr+pHhuEHEEKshjj37pU0Qm2Fek3NR4QXioe+nl6yI=;
        b=IZClT48cIl64yNuojrNkwnNBzyhvG4xcm5SoxsMLQARs4tUvkdIlidJAbMnB64TC8X
         qG/REjuSKTDEa3nIgfCtNQ9v1uEI4mRl86Wm6dEeTdw1+VlWYJOAXoNHMqfJ3SolWMpX
         X3X1i6k8HFefov5p9EJPlb51ur7A9Zb0Wewrfd2A//l/5mPmW66pYGL1ECEKEyFSWA5D
         fTEGZM6LEuqRQsOS47G/Nit2Dx69fgBwJHjPO7hUoihb74VZ5UhwDGGAqwsbfg0HQj6V
         xUmW6K8SIpxiQ/Ei5SPDz/l5sn+Px4d83XZ7RKM4jGViXCQMef05NJiAnS/3BRnDdxAP
         nufg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795640664; x=1796245464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jAVSepPFXDVnDs0KIr6D847y94ZRdB5eQ9a+FnzieW4=;
        b=tCCn15NCr6B2s9h+dyEIhTKGSEflko+n1w04t5bIriAO1IiieN2gSHg4HV/WEl8n/n
         skh/ncZgrssBgOFYKeg6/d1gqPkQ+VBgVEG/t2TuVmvnrdFK80K40DCRzylsB0yBptCm
         V0MKB1Dme+IWbdkFs3CtcbbOj20PlcP3As7bsHwvAQD9goiLsN53yAcBR+OscqGBBrTj
         8qeE+Zqh/Nqhm1nMzruqVFpfGBAp5IBQLBIbqiV2731/Ihk1h93G0CVEpeVMmljB/1xX
         TYB0fIb5FrlJVeTKex+6oDGPwnRB9RWtA5t3Vs0ATeF0EMW0RKniAXkORt6y9Vz3uezV
         iYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640664; x=1796245464;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jAVSepPFXDVnDs0KIr6D847y94ZRdB5eQ9a+FnzieW4=;
        b=oW67GANc6wZsjArBOtYCrDuCY5DeNm3NZxf6+qZWQwJzRD4ndNVwmdwRkaDcNk8zf5
         QgqH8VqcKtPu/+uk3KgozUosAvvlKp7/C20Bjn9T9KMeIT2gdeno9+t+M2GlvQq5pR5Z
         oK3w9z6dZir06vYPpwbl3avuS70FvmsymG9E8n56JHlV8M6dDDPEiPSveWeg/w/s2XCP
         ZQszUR8LmxfG8EfAoFfdErmFO+Q0/rajfJk9fk/a8F+/MbIJ5nIJibL93ZfdoPpBR2W0
         92f3bvdiUt7IJCxPQPPRAK9VHeTvU5SLfajLNrJsqHwqJ9VWiIHwsDOm5He3oMC0MOpH
         bS6A==
X-Forwarded-Encrypted: i=1; AL+hErH/P0MN+EX4gd57iR24P1TxH03G8R/LRlj2nIIK4VOZ4o6bAMEIYY5WY/o7pyRC2n7D/fMOtIaTRrvQ3A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ueGUySpY58oxAqfAbcf/jkQQyr1MZlgn0I16DrbjeMsQsoH3n
	Q63w/M7EpHTTG3StpRfwpw36/vmDnSToQ1sWhTcVznAtoL24l07p3sfALH3OgJXQvm+nxdE7qjh
	60bpYuVHLGkOaRsCGnraQRTdC8CbW/12XgNgCrsI31g==
X-Gm-Gg: AZFdTZcXQjOErkR3J+YPGmF2xnlfghKuFqgNfWYPWD3JfEqjdi14PRZa7Y7XuoZJ6No
	5yCRgcxSIOG5YfF1Pfx196MxOSUiRcchHmTB41THrIjQsvjYc1jAV5+z9MhprfGgf+bFDOAYhX7
	mwSXsqnmA86r6KafABal+vhRrSEa4tJRkrmmmpRE9NXyviDmkkC+bgRQC0LFO+0FTRsAEn5ysED
	v3MGrPK9YZ3AhPA0ey/Q8LO+xMB+JOhVQjOBzX4uNExdSix6XGaAePJ0zHMym6rLQZD1SviGFXX
	BFbBxnzqSSSJGmw1sSK3D9LBKx82aVBY1jeFdaj/ZPczWMrMc0UtknCj87tbYawavSSonvCiZAf
	U2ME4cNDzwgDvk3NhhbQ85V3eqeGgzqbdAcVNgZulOP9kuYqL0Jz+P4BiyxdGDe+a/jITI6k=
X-Received: by 2002:aa7:c0d0:0:b0:6ba:144f:ae43 with SMTP id
 4fb4d7f45d1cf-6ba37c7b138mr10360793a12.6.1795640663702; Wed, 25 Nov 2026
 13:04:23 -0800 (PST)
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-gs101-usb-phy-orientation-v2-0-3361fa5f7543@linaro.org> <20261123-gs101-usb-phy-orientation-v2-2-3361fa5f7543@linaro.org>
In-Reply-To: <20261123-gs101-usb-phy-orientation-v2-2-3361fa5f7543@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 25 Nov 2026 21:04:11 +0000
X-Gm-Features: Aa3M54oVBZq5tOYyeoj6arLLradCyxNln2xhQ16gdyoLzIDJohPkD6NVk6Xh8SE
Message-ID: <CADrjBPpE+2n1Y=02Ayz8i8guJ58XBzdG5zVdLJW5ZhQQKiNmNw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] phy: exynos5-usbdrd: apply gs101 postlock tuning
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
> Phy tunings to be applied after lock are never applied on gs101.
>
> On gs101, gs101_tunes_pipe3_postlock[] disables the high-speed squelch
> detector when in P3 / U3 to save some power. In U3 (USB3 suspend) there
> is no SuperSpeed data traffic to detect, and link wakeup uses LFPS
> through a separate low-frequency detector. Disabling the high-speed RX
> squelch detector in U3 avoids keeping it powered while the link is
> suspended.
>
> Apply PTS_PIPE3_POSTLOCK once the PLL and the CDR have locked.
>
> Fixes: 32267c29bc7d ("phy: exynos5-usbdrd: support Exynos USBDRD 3.1 comb=
o phy (HS & SS)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsu=
ng/phy-exynos5-usbdrd.c
> index ccaf0f27c4c8..f647688c3bfb 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -1745,6 +1745,8 @@ static int exynos5_usbdrd_gs101_pipe3_init(struct e=
xynos5_usbdrd_phy *phy_drd)
>         if (ret)
>                 return ret;
>
> +       exynos5_usbdrd_apply_phy_tunes(phy_drd, PTS_PIPE3_POSTLOCK);
> +
>         /*
>          * Set this while still holding phy_mutex, so that the orientatio=
n
>          * switch callback can't miss an orientation change.
>
> --
> 2.56.1.750.gf70dc682cf-goog
>
