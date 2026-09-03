Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADE430C160
	for <phone-devel@vger.kernel.org>; Thu,  3 Sep 2026 12:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788438479; cv=none; b=knC/OfRKj9NwcySHUCSXF4CFvTOMXAcJVpX2zflcHNKicUIHxhezVXjjy83arWSVGGKBIJ7Xg0Naui/NxYU0DaE0LhipkrUslnJjxgI4kptbNe6Wihs5bsLJ4x8hqKEQ+30HiClg65wzl5vgSf7SuMrqLsz57dn0hdQYPqictfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788438479; c=relaxed/simple;
	bh=yBREPNQ+9TvG0tnPlYi3yjHjFlrkdvizj9rCb9Izb/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GMX0BuTHPie18TGny8lttxSoFF/tEom2NWusbU8tqTQyoHn06hbAsXI2DGbQnMH8Eb+EQfr/GoDPUIm61ynkh0TyxvFkUHjHq9txwDBbuaXYAIGjGOiWooAZKVlM6MkIuajCGQj+Fkwp4dwfiej7QXWuEezyJxHWw3FlJ8NZbtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xOstzSe4; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xOstzSe4"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-484362f5c4aso2355588f8f.3
        for <phone-devel@vger.kernel.org>; Thu, 03 Sep 2026 05:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788438473; x=1789043273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tw+G2VuS/9mcJ8+kFfuQYOqB5Sl8sLmu4WySFKMDMUI=;
        b=xOstzSe4d7U/Btk3P4nY1RWJMBIgClUPTkoVrqM+o5UxOK7SkNnyerK8Eq3drbbEoO
         fYkriZklGCRWbO7NC9mXE/LA2/XjdEdoXADVYuZDNmW+5Z03EudFK23vkYriMWtstz5n
         nL954RVtV21cpraqT7AlXlWvom7B5bvkpq3TLgFn2DpW+QLopH2WKQkmA4V2EmAISAix
         LD6ttRNpHCMof3dYk3C81sNRVad3rzDrhwUGYQH3HsP5m1XRm0jsATu9L0H9jA/88UDz
         B2PVS9tmBefNPbCuRuqqHL58XBbX0obZdRAVuA3B4AonXifzaCTvK76UDU8DgyAE6pjZ
         bXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788438473; x=1789043273;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tw+G2VuS/9mcJ8+kFfuQYOqB5Sl8sLmu4WySFKMDMUI=;
        b=rPJeZfqGFBEJ+U6SN9LdNF/SudfYectyii70zh5VHts+0gtsRxc9UULYLSRojzE6DD
         jD7gDbJcXlPMUtY+Z6/Xea5JT2AmZ9sAgFNNGbJQx39VxU7DMAU7geKvB6rcsH+ZKagK
         l1p7Rvz5Gt69IlwjNLWfPsHfitPtOnpRdurplz3+IveQWuHv5QqvCo8dkBixSXb2HFay
         GTaGmzdrJ/I5GU+3Emf4TgBiUWOWF203OVY0ZmWMje9RQ1cxqnt8oBe6bVyid3cKmHyt
         b3qHiJVV6/srtZjCIgvZLt5G562DzD05zT8IRl7efxn0rLDgCY2JG8tInEL8G6RWecvq
         3Eww==
X-Forwarded-Encrypted: i=1; AKwUvBymVUtyOUsM9+Xc2bERym4bgyAlMxlXur93HdAnQTNO/Buyio1iECOxakJM9PqurHil2yaErfun66mPbA==@vger.kernel.org
X-Gm-Message-State: AFuF++kqexR3lxye4G+Jfd4I08dGRs25Tm1tvNjtvyKzUuaOQe3llPtv
	96K5QS90ip1DlViME/ZmVq2imbtSXZkGtqYeIcQWMxs+MM83lzVnBLSVrMaqdU3/xeo=
X-Gm-Gg: AYBFou0RfZBxTJ3laYRYOTSu0TdMDHofP56mcj8xZrsNOt09Z/LZk5Uj3Qx9BL/Zf1I
	FcQao6vwFnxVjYGZHHlW/jFNM2K3/9Bj+3170y16bJNAQ4fhJ17OppXN+Z/XmNI5ace8NnQ3o5D
	h7M2DRpS4UxxZk4tWoHherTSyevlhlpwLVGtCsQe/0ay2Tibb/eKWm10N5XZI2ugSmZLlig/qwK
	YGiEcw4tkzOZTlBF5FlRDf7h2ZeDYhTYktMBnpGUMnUi7l2OPP36d05J/fD7YDL2vaAsRO9yG7X
	b7HHwxzDfBrLpObRdNK0cVJmpny+N34oohLPVkpu7Ih8VdNV+oAhH3eaorIO6IB6qwpQYfcjmnZ
	cditph9EUouVF1SAwtq7o6zOFRQ79C6HThJRYlmgQIkVnvBbCaSgzcJ9ml+TicPalJNtaVnl/d7
	Az5N7GLdxI63eIKCmnYgGmEVyvzA37kjlHnPr/372Qwz5nH9bJAzxv1uFw5otZXRstvDJ13JDgR
	vshVPwk3NCDW84W4G4mCluWoizGw0cswmaY
X-Received: by 2002:a05:600c:a47:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-49ce5844d77mr182853165e9.13.1788438472750;
        Thu, 03 Sep 2026 05:27:52 -0700 (PDT)
Received: from [192.168.1.37] (p549d4d01.dip0.t-ipconnect.de. [84.157.77.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5dead1sm66930425e9.11.2026.09.03.05.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 05:27:51 -0700 (PDT)
Message-ID: <2bc4b565-94cf-4c9b-8aff-7b6f13a08cfe@linaro.org>
Date: Thu, 3 Sep 2026 14:27:50 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] sdm845: Configure USB3/DP combo properly
Content-Language: en-US
To: david@ixit.cz, Sumit Garg <sumit.garg@kernel.org>, u-boot-qcom@groups.io,
 u-boot@lists.denx.de
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Tom Rini
 <trini@konsulko.com>,
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
 Balaji Selvanathan <balaji.selvanathan@oss.qualcomm.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Peng Fan <peng.fan@nxp.com>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Aswin Murugan <aswin.murugan@oss.qualcomm.com>,
 Federico Amedeo Izzo <federico@izzo.pro>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>, phone-devel@vger.kernel.org
References: <20260830-b4-sdm845-usb-gadget-v1-0-9f20e842d628@ixit.cz>
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20260830-b4-sdm845-usb-gadget-v1-0-9f20e842d628@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi David,

On 30/08/2026 00:23, David Heidelberg via B4 Relay wrote:
> USB gadget mode nor serial console does not work on some sdm845 boards:
> 
>   dwc3-generic-peripheral usb@a600000: failed to enable ep0out
> 
> with exception of the first boot.
> 
> This series implements "qcom,sdm845-qmp-usb3-dp-phy", so the USB3/DP combo
> PHY is never bound, GCC_USB3_PRIM_PHY_PIPE_CLK has no source and stays off,
> and the DWC3 endpoint command times out. It can be masked by an earlier
> boot stage having left the PHY initialised, which is why this only shows
> up on some boots.
> 
> Add SDM845 to the combo PHY driver, plus the two things needed to make
> it usable: PM8998 regulators, without which the PHY cannot get its
> supplies, and the defconfig symbol, without which the driver is left out
> of the build entirely.

Thanks! Hopefully this will solve a lot of the unreliable USB issues on
SDM845.

Reviewed-by: Casey Connolly <casey.connolly@linaro.org>

> 
> Tested on Google Pixel 3 (blueline).
> 
> ---
> David Heidelberg (4):
>       phy: qcom: qmp-combo: select PCS register offsets per version
>       phy: qcom: qmp-combo: add SDM845 support
>       power: regulator: qcom-rpmh: add PM8998 support
>       configs: qcom: enable QMP USB3-DP combo PHY
> 
>  configs/qcom_defconfig                        |   1 +
>  drivers/phy/qcom/phy-qcom-qmp-combo.c         | 168 ++++++++++++++++++++++++--
>  drivers/power/regulator/qcom-rpmh-regulator.c | 137 +++++++++++++++++++++
>  3 files changed, 299 insertions(+), 7 deletions(-)
> ---
> base-commit: ece349ade2973e220f524ce59e59711cc919263f
> change-id: 20260830-b4-sdm845-usb-gadget-c43be8cd094d
> 
> Best regards,
> --  
> David Heidelberg <david@ixit.cz>
> 
> 

-- 
// Casey (she/her)

