Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4953B6C0D
	for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 10:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774866193; cv=none; b=TbI5eYOnhY1V2HfDPJjqrU8WtS0FiN1Fh8Rf2mgYj/X0Bbwmf0DBZT4aQnkP5TPuIGWEx2ytgD7/ZKlYo94JEgGLJQCO2oot+CKGtX7vNjua9lDIj+itEipCw6o2QG9yew/RrLYdyI7v4Nggea7uvnTcq0vqdpnADlfdrv7nliQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774866193; c=relaxed/simple;
	bh=2OLJ94HJlikgcrXqeZIl7OisNTmViXdEeC5UBZ+pjOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gxsPTA209FLHMnQ6IknUoVSoM2HY1N1ku9yjBd3a8+eKRLAnTCh/gGVRI5eCFT8g+53dgSGqsKTUre8sIUPvFCuwZTi+6BxCPJKQgD1SiT7yyHF/aXB3h8CziOFtSdQzmaIGqRa7oPDOSFmjRXawM7bOL9Sw9EcM8dsAt1N53jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWuRtQ+N; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWuRtQ+N"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8297e0b27e5so2165463b3a.1
        for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 03:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774866192; x=1775470992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/SA3PxxzFOYvhnPnfnyUd8N6LpFu9KYx7x1Q4uLkmQ=;
        b=GWuRtQ+N3/ZHQYDY1SRg/nhWJVMV5pcvEmkEgMwldT1nHgfgoe7BtDEqn03L/SXX2i
         TJSfwLsJrhKscuQBzG4El48F+ISBbER58NvOHRXthScCVw3k0fKcwQu4pvy61YUPwF54
         RbgGJvTMwW+rK/z9IDgvWHOBcOsg1X8A2nDLOhP8aCKiw0gD0S2X5hegl2Agaf8a6VhU
         LgG2fnkC/eKroP9IU2T58/F5m9xcBEBPSAnkLQLIsNRXeHGtMtSJtPTB6YHCbOjSDEbG
         Ihy6QEGVli1vxCe+8ThxxUIYnsVtM4TN1sqgwMVwRzyMsNwNId58Y1YEMxtFsu3CZgfs
         WLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774866192; x=1775470992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2/SA3PxxzFOYvhnPnfnyUd8N6LpFu9KYx7x1Q4uLkmQ=;
        b=R7kPbwqNyX8+DS4zAcljn/QIySoH77+4PryJMaMUnSfIycGQPLDsZ5mtXO8C4RHQ00
         /MJoA9bemrA2b7HeXywcDWhoUWfuIEsOSs3Ng69I3AyAMZgP5JC1kNMmhKBvyOob2TJD
         MdjE3gQ3oJbNJj+VC/O7+zjM8cIgnUIaHl4CXrUhw4LdxXdRKcodQ4y265ML0Re5yX0C
         4u9OQffoNkvh1HEIOnPWiuhuTPqoOmZd/g+ZsRUu7abZmudERIj7mhkt0Yl36/Xs79jI
         Z4kWaIjk7OxSSCDRkWGKSLiFP4bL31lV1ZN7TBaLfm8Pw0pvN+qT2GxffCJ1b4Ejcbxx
         ynGQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0058KMktsJlR0NwOcMFyiRG+5wF0ENEOKppqj5dx+ZCWaFelwwxmxghIpBxKb8C4hXTgLzjZ22iwC7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIq8YXTNlUl2Z+Ix/phaEOB2I+Ze30ymHN/QqNfAZ1dSkpvH71
	3i5AjXgNbcTUhgW6zmtL1y6ADAzaMR5OlR/LNyPKRvGnYuthfrrahm2b
X-Gm-Gg: ATEYQzwfCUh1ZH67pEkWuhSwss3/2DyiGF/HGPOGDQYClIVdZ3fAHTR2XFHXTuv1Hur
	RRTIi7mDRTK9LU91sQu4utsI4HFAE1B4YCOD2Piu4OaXTHlGK6fCwrnwuTLArc0NB0MYrRh/kJL
	sapFzKp1lNauScmCIxDRAKzR6POhfNp39RW5O33HDmBvAWG6WeHn+M5SalxTCBqRVrT+Tsd7QkT
	F9L6U7GcaKIeZ9LOufrQvFhktaASbbnvF+sGfZbieNqs4RQApO/WgWP3mG2nb6DpR7pQSbDmD8S
	NOxRAcItwOgu+RG58fPYCiTUjPeiuy2b0hMmW8TtRO3w/I4KdNm//B3iWyuubPZ5yuOFFlGYTkE
	fDWLfQXNJnpKGCahq7BeefjCVNynVXoceZIiGLaRJ99XyAwK8/7yAanzfpk+SODZ93D3urWsZ5S
	+mG19MT/HGZeIuwhp+ijHRalkrUb4kWvg=
X-Received: by 2002:a05:6a00:b4d:b0:82c:9266:624b with SMTP id d2e1a72fcca58-82c960a3472mr11682638b3a.47.1774866192040;
        Mon, 30 Mar 2026 03:23:12 -0700 (PDT)
Received: from ArchLinux ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82ca85fc72asm6948403b3a.48.2026.03.30.03.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:23:11 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sean Young <sean@mess.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-clk@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	stable@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/7] Add vibrator, IR transmitter and USB-C handling in xiaomi-ginkgo
Date: Mon, 30 Mar 2026 10:22:55 +0000
Message-ID: <20260330102256.17631-1-nathbappai@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 29 Mar 2026 04:47:55 +0000 Biswapriyo Nath <nathbappai@gmail.com> wrote:

> This patch series add support for various components in Xiaomi Redmi
> Note 8.
> 

v3 of this patch series was sent here[1].

[1]: https://lore.kernel.org/linux-arm-msm/20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com/

