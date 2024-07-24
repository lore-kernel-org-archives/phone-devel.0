Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D34213AA47
	for <phone-devel@vger.kernel.org>; Wed, 24 Jul 2024 08:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721808006; cv=none; b=NB4TJVOUWj+hWUakARyuUEUUBk6OVyeyG8BB65BLbXRscRhl5Pvq8/b5nkZamed+RwGL6tDt7m8Pyn1UoDXnzFEREwf5mwFOhkU+/IW09HNbjSUC1wV64P9mX8Hu9LUVhvm3GXqcSQaoc0fZ9WAOGn4s+miBu2xnz38ifrUIz7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721808006; c=relaxed/simple;
	bh=KfJHWW8rPX9BqxLu9xFAETVxp9PuX5ktMrit6g/vK9k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Lxez9393WH1HtHrTa33Yu2xo5S+1U5BB5FmdDQkN7eMTnUnanEMukEA3s8PquWveNho+daMcT4Cu+gEjJ5mIYD6zsqAaxlTWZBrdWNxY3WC/33sl8KbirNhLKTNbNbl1SliQpSZIt8ncV2aWj2i65nPKF3iv1YKZNC6PwvJsEsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cHtPIuJV; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cHtPIuJV"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4266edee10cso43239665e9.2
        for <phone-devel@vger.kernel.org>; Wed, 24 Jul 2024 01:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721808002; x=1722412802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVS63w01WpSMud20iAQLpb49vEgN8TqlZNBMv50zLlo=;
        b=cHtPIuJVKRo+YnbruwMKRNIUpB6FPt0CgUK6b4HwYvJ7GcsU+s1VmmWizW1o/fdEEh
         48tMwqjSh7OfNPmAqbRkEavLezTCPGUB8C530a2FfnDTRz+3BZ5mqfbxRXJQv99pAbOT
         NwHMHX1ObiUBtpyd20KZBZPgllUM000QSx04Gacird0AsVNJfFMUgtaHQAcB+yuGO0tE
         CapwCBMJrln6q6j3hl2yPR2cXBoGdnUe8isbnrCFBUviAsOvUh8iX45WPhNxBj2y3IcR
         E0rhdlwD4HASl5q6SNWMB4mxwqlmp9oQVMAgcTtQqJor+x4pgu1jceT/CiwE0Tf8qcmI
         Lz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721808002; x=1722412802;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVS63w01WpSMud20iAQLpb49vEgN8TqlZNBMv50zLlo=;
        b=VGOko1QDFs1l7yRuCQ+gEZ5U67JrToooNcvEehucfSg8KI6gtOwhDw0GynXv/gyM0o
         +8/h5pr/NaZDjg+bMOvXyh6VnIxch4g97O4KILoNVKVAg8r9DAuXym+/ARbwZlKRRNYl
         lGp4Me5QFhQGUBNIlS4mgt10O8Mq2FURTFUAR4I0U1fQTMR3/FVYtb2RaN44ofG0wcaw
         uAenjl2Ptc9xpx5xX/CUqUydqxjc9Rc10hJhKhuGdoYCeL99x7U3pWoreb9K2VmfvcT3
         hDFl139T0uXxUXbhqYVzAqQj+Af6nwxdP5ijXwX9eJpx0AQvrpV7itob9pasKs0iVMh4
         g/rA==
X-Forwarded-Encrypted: i=1; AJvYcCVG9FxoHi4dJkk99/cjnrwMw44jBOzigxeS1haTk3U2Sre6RPPOGl6+C5sWDkG1UKjxcBBeRl51+9ppW+DS+fdlY2mxsBQOofsLOSc=
X-Gm-Message-State: AOJu0Yyke6eSHA+Qwn6IagFaI7FVRfe654b7r0n1ylj6un78PWF2KmR2
	zsZAKK0HwH7uetfTMHo2SYIzTMxiviRG/mrRu4eduIuRqRxTNXj06ktJ1oAMysQ=
X-Google-Smtp-Source: AGHT+IGfvxFZZ2oIYZG+zvMY7HF3H5YwnYk9X5ZGtapXxEl9G+IdNM44EBKe1XDrOU7QfMBIc6isSg==
X-Received: by 2002:a05:600c:1392:b0:426:549b:dd7a with SMTP id 5b1f17b1804b1-427f95b7114mr7693205e9.36.1721808002176;
        Wed, 24 Jul 2024 01:00:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f1f52b8dsm33884015e9.1.2024.07.24.01.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 01:00:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dang Huynh <danct12@riseup.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Marijn Suijten <marijn.suijten@somainline.org>
In-Reply-To: <20240722-bf060y8m-aj0-prepare-prev-v1-1-0e51c0f59d22@riseup.net>
References: <20240722-bf060y8m-aj0-prepare-prev-v1-1-0e51c0f59d22@riseup.net>
Subject: Re: [PATCH] drm: panel: boe-bf060y8m-aj0: Enable
 prepare_prev_first
Message-Id: <172180800135.4044086.14410654931478302593.b4-ty@linaro.org>
Date: Wed, 24 Jul 2024 10:00:01 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0

Hi,

On Mon, 22 Jul 2024 14:07:15 +0700, Dang Huynh wrote:
> Enable prepare_prev_first flag for BF060Y8M-AJ0 panel so that the
> previous controller should be prepared first before the prepare for
> the panel is called.
> 
> This makes sure that the previous controller, likely to be a DSI host
> controller should be initialized to LP-11 before the panel is powered up.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm: panel: boe-bf060y8m-aj0: Enable prepare_prev_first
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/61eec998c9399d1cce91c7a2f51a4d0cfbab97bb

-- 
Neil

