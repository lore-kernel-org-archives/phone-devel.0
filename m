Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38872FF661
	for <phone-devel@vger.kernel.org>; Wed, 29 Oct 2025 10:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761734523; cv=none; b=tXL7BX5Oumu39vWp5JDCv2WHqzNryep7KeKY+P8+vxg285JRT0Y/s9Gr6mc5+ro6Vs7hOaVlFyfkcXWunbhaLgr3Nfu2mfkI/7PYSkDj9ZigfjYwiusl1pv7arYK9ET0LsI/vIN0xyagaAIvH+qNc3z60GOaJ4exprjnQjtoYIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761734523; c=relaxed/simple;
	bh=AUDqFfVw/6OEV65Z6YZ8rdLCW3TA1z/nedV4oyotdPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SfDtIH2sZpX151sf7aFUJ0A43HF9mgoulyIGuBF0Si5HtSSx55IXHETPxGXyaGqnKM1jlPpC2W0dJc4LJk473BfiNvw3jtvwjXQRm/tkW5qF0PhSLIX9zYtoXxOHfj6fIm0oz1D9WQNRWg3trNNGzvIc5MUTwuex0RtqSlF1RSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=R2PZTCn8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="R2PZTCn8"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4711b95226dso89153595e9.0
        for <phone-devel@vger.kernel.org>; Wed, 29 Oct 2025 03:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761734520; x=1762339320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3X4E3hHQ4vm0fEjCZ5UPCa76r6tX7WxRSfwf39l4Uw=;
        b=R2PZTCn8Vxye1cwzPwcvsrc+w83i+sfM+Ny3gEMZoKT6XhJB9jY48Dkpb/LSg/QUvJ
         D6fpevYhbnAjX431AnxdDnZqyrq7XaDKwQTSRGdzzf7jsa83oGDJd42mQBvDcgHuX0nM
         IQPBqE5nju71NUNhZo+4kseVQTh0qsT58h5WlCUT7YF2OkR5x6F4olpRCQOvA38rw0Dl
         pqISNDaaE1oR7j4ji3PnAICgqdv0cckNx8n96Qa1jvM/FjYGb1f96RWaGPeeecO+0/Qt
         BV17vFTHxIQr0H4VQDeDTMZmaro4UVMmeWkIGG5aaq71LH4i1DBSWX7wMxI0GKqB01il
         Hq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761734520; x=1762339320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b3X4E3hHQ4vm0fEjCZ5UPCa76r6tX7WxRSfwf39l4Uw=;
        b=Grhe6698FRCf2Hq3PMDElKd11WcoRHl9+lQAUKcjOCuj0OEn9BGA+51coP/lnqqes1
         z6n51bBzSCs1KQbdvS7I3QKk2nXnXjOtZp0Von1jQo5nj8+oVp4YY5es2BVdpBnXAane
         Cdp5vgEWU9GpMV06PYFJVDeHyf4qea6vK7bXxFhn1SWsB5OXP61fKHGkePp7vvz4hgwr
         uuezTRtslQ6lDBaUXLCgdLJoz2DRcP6BJUKRcmi+obqcdrpLfL7MOFVzwLnMM3wtAEJd
         Gg4apjvX8JC0CfFDbBoPCMuc0JAei59rM034dE06VyNnn+dtcC7RMR4zS2ikbBT0xVWw
         FjlA==
X-Forwarded-Encrypted: i=1; AJvYcCVrRqifQ/D4fSwALzZkI0F7CXuJshy2Key/c2TpzkCWNcFsSTCUJbxYrm5ozv1A+JdwlQ1oYLRngKyEow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh9axvWr5ydrJWlNUWDkG1n6fyK7FcWmD85VRbUhMvtX9IJdAK
	syKTYVQdRqJQKnJpQBWrefy0Lj8d6hv0csT/4NDB8jIdWmJOpDamy1acyk5EBAPEUgQ=
X-Gm-Gg: ASbGncsINeP7rs3LQZV23wDF+ReekyFXJPgorr7T5rEw7uIvD9x89IKE4RlOrXE4vxU
	/d03MhQzrp8zn99t34dZ80xbigooexEKm7yD3xagKtZt3ZwuocGu9IVGC/2UceSBhQcXyQWKib9
	rABTCtMw1Y6NGuAsHt/SJP+wlXVl/RgtPcgoaIyPWPJ4Fo8OCrqfzZn8lET7e5J3vwuTGjiwi3J
	nr69nbIAS2Og2nmRbYRq/fhmhEd5qAoEY0uDQ2JPr79Lr42wH6XHWUauT3udRMxs8w9hvwAKELn
	D+Fzmg1BvV1c95NgiVMEe87Lyf2tKHFhwferw8EHkC/NrZQdstrES0J3s5LLrfzIOFExiayD/Ud
	JZzsVbfdrHoSh5ybCHKBLzg4lg645N+coAQ5nNtP0ggl5wL72YnXuUmSE4n/S3HNjW2+AGmrVoY
	AyWKBhaUTBDw4O
X-Google-Smtp-Source: AGHT+IEr0/AZFy2/29X+tk87HEM/p5Fa5fWpVSnd5/YgcWtERKefh8/xi2PyHwwU7M4yWjRk//ZiAA==
X-Received: by 2002:a05:600c:3e07:b0:46e:48fd:a1a9 with SMTP id 5b1f17b1804b1-4771e3fbdcemr21558395e9.33.1761734520102;
        Wed, 29 Oct 2025 03:42:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:69f2:5f2d:9ffc:a805])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7ce1sm25165417f8f.0.2025.10.29.03.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 03:41:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca@lucaweiss.eu>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/7] Camera I2C (CCI) enablement on MSM8953 and Fairphone 3
Date: Wed, 29 Oct 2025 11:41:58 +0100
Message-ID: <176173451403.17889.9951642355826230455.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251028-msm8953-cci-v2-0-b5f9f7135326@lucaweiss.eu>
References: <20251028-msm8953-cci-v2-0-b5f9f7135326@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 28 Oct 2025 17:40:45 +0100, Luca Weiss wrote:
> Add the compatibles and config for CCI on MSM8953, then enable these I2C
> busses on Fairphone 3 and configure the EEPROM found with one of the
> camera modules.
> 
> 

Applied, thanks!

[3/7] dt-bindings: eeprom: at24: Add compatible for Belling BL24S64
      https://git.kernel.org/brgl/linux/c/aef72ebe9c86b516c6e126d4b453c96496547f0b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
