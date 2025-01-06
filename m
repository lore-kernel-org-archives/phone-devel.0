Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C70D1DFE3B
	for <phone-devel@vger.kernel.org>; Mon,  6 Jan 2025 20:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736194893; cv=none; b=bej3Kan3a0gNYAU+0ZjvvXoY3X8MzImynoRP+25U2wyn3hILCdLWD0VHz6782wDikvptO0nI3X8n6RkSYKsWyHRg/ss1xqVwGhlTZi+OsTSGk9szhLq+D95VPX8MBX1h/e4V6u9BV25cTXzoNTWFGOSgEb8MU25euLFFUaKAxh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736194893; c=relaxed/simple;
	bh=bMAr4DQGzlza/TutyhbPaI1HQ2tcZJbHpg/SajkA+Do=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RSory7ws7DnQNuvvwm9P4jtT7i0i4+dg3ERIQMxfSkXhyx35/xTcoxaVeZVvr2gmWLS+3tXuehfSFGer5EoasX4YFP4P7VuXbWetLHplthpiPLtPBPcu/VDfoydI+u+tEMT2q20ZXdmVzHnx2l1zQm2umUjZGCEanuXobMckxGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VEPPO9yO; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VEPPO9yO"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3862d161947so7044528f8f.3
        for <phone-devel@vger.kernel.org>; Mon, 06 Jan 2025 12:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736194890; x=1736799690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N08679NMA6u8B70kqY81dtpRf5QTarA7SLWj7Tm0mBQ=;
        b=VEPPO9yOrtM7AwJMvO5TUaTzpzfEKod72PJMFGjyDP7+5P0lQWsYVi2JeOqanGduid
         2imuFl2sqEl4UhQP5U7hYZCBQ0SyqAMkkzDXMsy+bl8Z0AIPWnx3Wte7L+hEEkWMNeui
         kpjZjNpsaOjNAtENgJfM51DJThb7St8cs/V42J0k99XTnt8JCbkuF9F+BI6o0mT6pQHF
         KeAiA2eIH886FQyrcSVdywQGgTY6J94MW+wm4h/qww1j4Wu+EnyuFV0/4bliu8ZPFC1+
         8Z/DwMtSXAiiwjdYHq6ojamHyds5Zp40YTUFMy70KTkpIFD9k5Sn3qPQqG34XYHn5vRC
         QSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736194890; x=1736799690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N08679NMA6u8B70kqY81dtpRf5QTarA7SLWj7Tm0mBQ=;
        b=ROgiJ+vuLiPufL7PQh/mCjGD6j+V+y7AgVV9aE08XbcQJTomSmlPF89SawkRCbKGk1
         8MdGrnyTRVYXmE7MTXQK1zEN/JypLnczSxbN/ky4IKIwZRUpuMp3fYt3/adSWCCjOY7r
         zG2mVENWlWuPVmMy/NGS02BCd7E4ts76rP2LZcgvSoR/+9loFGMak22MXx1UNe8XJlRM
         7/JoSJnciKncPwLU4yfXBfxkarvMwyNSGGc18360DllB7ZSlJ7MdVmWuUVO0AEFYCS5m
         knJmciDbjIUPAHU5F44nhdPhkPFrzMa37OGRwoS/r8uc2cS9HzMvuA74z7ifvm9PeSGQ
         7V2w==
X-Forwarded-Encrypted: i=1; AJvYcCXW/AIZqVWuhM94DArlSQQ1pVe36SwIvgVZ2uSFyx/fIqRFppJDw1xl9nISgs4GBtfG5+ODRHfauucPlg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo0+rBOmtrYtRBRb9nd1AwqYm8SPQ550VB47bL4ifqdWqxw/e9
	JWyh9aEc3i+edhcjRXvyXE2J+F915WNUAoNniQ+FqDitQimWp/yC8O95IYCVT/s=
X-Gm-Gg: ASbGncsxshtMc7LcJkHtJlhXyLHP+N1/8GmuoDyU/ktDUMreH4oniXW0J4FR4QAUwNJ
	NAzZ/OBJ3qNA5y5O77BEN+icVAdxgm+jgxTU/ld8blxa7ZIusAnok3EN5Rt9MuJAYnN6/5Or/DR
	rK6HMD3DF3/l/P00/h2CWJ9dxK9o/4N/ooni4pe9IsKZ+WivEbDMUTOUzD7zQ53Van/XFwe2XG4
	4J9GS5fZ+ACqyPpQxbef4S8KJvuXj0wk+hHsvdrHuBEOgj8hLSiMg==
X-Google-Smtp-Source: AGHT+IGcUgKVgqgZbOiKeAaKRBuyaX/xWL0sgO52tcYB5Zp3oWkT56O/vF9ag2QUJgqxEUh+Octj7w==
X-Received: by 2002:a5d:64c8:0:b0:388:c75c:e839 with SMTP id ffacd0b85a97d-38a223f7167mr46626721f8f.42.1736194888096;
        Mon, 06 Jan 2025 12:21:28 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6d7c:e1c5:e9:58a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b4471bsm611364335e9.44.2025.01.06.12.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 12:21:27 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH 0/5] Add EEPROMs found in the camera sensors on Fairphone 5
Date: Mon,  6 Jan 2025 21:21:26 +0100
Message-ID: <173619488358.255016.2244642661299426243.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
References: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 03 Jan 2025 12:11:56 +0100, Luca Weiss wrote:
> While out-of-tree already two of the three camera sensors are working on
> this smartphone, getting those upstream-ready will still take a while.
> 
> Until then already enable the EEPROMs found on those camera sensors
> which doesn't have a dependency to the sensor drivers and gets those out
> of the way.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: eeprom: at24: Add compatible for Giantec GT24P128F
      commit: 56d4ef115cc51b1fe7de1e695923126923c9f9bf
[2/5] dt-bindings: vendor-prefixes: Add Puya Semiconductor (Shanghai) Co., Ltd.
      commit: eace9d83c831c44b4f63beec18774fe4a46d12cc
[3/5] dt-bindings: eeprom: at24: Add compatible for Puya P24C256C
      commit: 36036a164fac96727ed724a388dae38d2f5f21c1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
