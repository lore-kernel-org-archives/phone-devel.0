Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6AC32692B
	for <phone-devel@vger.kernel.org>; Tue, 16 Dec 2025 10:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765881106; cv=none; b=rUqxMLT9jOYCr/eADr+1ki4tyXYnJHtkjYZnzYOw9JGANLYWrPVQR9dgGzI6ihlYBilWHp688VLYGrltO3fSnnRMvl120mVbxntxoIuI6MFOhcTZM+1mdyh1ZNdlsbaNfGlEgIgqK5ef2zvckZcBBEcHyATdU4pKVRH/AxKw1QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765881106; c=relaxed/simple;
	bh=OA4iMZDuZcyWyQupNSGMWlK+hOOk4+wcRSguSmXeI20=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KIgN6dDfkuCCLjGcebsdJmjkWrRZ+J4yg77djTaRBVPOepYxuHTh5J37SvpmuhcFlq5oiRhOu3OobGAXey7wJw6XiLFxNIW6SAlwKRuWy/0FzggZiBVa519YT+6FuMIS+3iYNZEV++RZTNHJfMp9qc8t2HyEfGVCGfq7DiCtU8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AMVYrNst; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AMVYrNst"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4775ae77516so52863955e9.1
        for <phone-devel@vger.kernel.org>; Tue, 16 Dec 2025 02:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765881102; x=1766485902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5F3GAGvtojXzfrnNDqZPNvA9zvELXurzGXYNSS1JeNU=;
        b=AMVYrNstkN2YJI9914s9FaeYsIblidhHYp9TGwzRgevW8JMuV0fLMgN3E0C2vgUa8g
         t0v6/kwVpdxGeJEqH2C8bFwlFMc1lIY5K/w+q7IrSY77H98O6ykDDBlILmgHAulSjGm4
         HoU/KPCK+Eqx4Xc6Kx737GgbZ4j/nC9jtxFvnjzFkn2YbwQq0JydtppET84zvUcJb4hN
         D/oCwmRZKczru9sSprJuJ5cYyM3CK6oqvF0ozRyKLuxoFCuNxwg/s9QisyI7gGl7BPyZ
         wm9bq0gcOTRSjXi7Ccw3JskwGoq1SM1sXk6DWBvwNheBgXXUXtWjoIx9xMvfYMG2mduE
         94PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765881102; x=1766485902;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5F3GAGvtojXzfrnNDqZPNvA9zvELXurzGXYNSS1JeNU=;
        b=eM14hyjNp4u/oKTA2efj+rwEVpKU7UqPvrtdmKZPS+Z1B/m3RryowhN0gqTddOwYay
         oh6yLOYKWLFWSP4AIGWgwUg/mJsrs6Ng8KIQAqTpfHmQu9gPOwhd+Zr3Kmu/VDk0C8wX
         0COOzdCzN/8OeJDdA/6ixuwjSHvqmiyblu0NrZWdaxAq6CY1uah9G/SmHH3k1yo6kzdd
         vl9eKIjdRjKrQUcqtGr0VShbx0IJi6L69TbYq3KaZty3+sLSH8N1e6O6d1AXp4xDrizy
         VLJU+3Ev0LvY9QNY0KYgmf09cmAnI282YvTPNzeHhxvIEC/0XMyEJYYY7GzAUokh5w/V
         Na+A==
X-Forwarded-Encrypted: i=1; AJvYcCXq9Odzo68O8knOZ80pxMvlVMzL5YjNBN6bAH6eiP+voeAlwo0KvIuPOQZF1rWYktSH4WZCZ1R42ChHZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnIFzu2eaFKEZ69DPurLt1Pq2Ti6ScjlV7zUtpy0snp8eDNG/h
	nlXiWdicK8Hvmrw0xjyzQbCyua3Cml/sLj2EzPd8DlWOE+hFD4s17Clf1dIctrC68nEZfORPL3J
	E3YkdAh0=
X-Gm-Gg: AY/fxX7Z3lFQabLbw9fzs5fb4WUELF2sbOUIBzY/s8axEZeAtoUBKJmmoUCQjw1oBEy
	WZq89QzgmaV2fMpCRUUQ4mwNzx5M3xKV6m8bX2BcS7qe01Kf837l7Y3krEQWTNIqZS4YJzfuhSM
	sx67KbjpJCfQE2iZOxAoVDMqYJpghJBjJtCcEaDxA5GePFX0KutDaQUtGSjlZAmt9QrJrFMceYD
	pr6sGyrT1FRXHrdSy3KgCcDQh7w/HbqhTtW7/6eRk0Twv1PKLgesCKOdWXBXq6vOpdEngMabdK6
	Fz/Ggvbeiyoju4WTYCRdAPPs/vm4mmfh0Wi/OI/jIptbr/1xbInFWeJdCeHYkYsrrHv5t8BiRBC
	xyyu3T5Nd8DjrKRNSZmTIEmWLxr6N31jtdoXgzLEmlr9x4GM8G86q/QvNerOILYCseOnKrt9oAK
	GcKWUngtMOBSQPWP7iPvlOBbfhtB5HFAc=
X-Google-Smtp-Source: AGHT+IG84hC2FrP21rLuYsftv8LEMIN2jKOtlRqZbs0BvKeHh9lWYYcuPTMdqRe8uDNf4GyhBem4Mg==
X-Received: by 2002:a05:600c:64c6:b0:477:639d:bca2 with SMTP id 5b1f17b1804b1-47a8f89bc56mr152345205e9.4.1765881102116;
        Tue, 16 Dec 2025 02:31:42 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bd95e0161sm7256525e9.2.2025.12.16.02.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 02:31:41 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel <phone-devel@vger.kernel.org>, 
 Gustavo Padovan <gus@collabora.com>, "kernelci.org bot" <bot@kernelci.org>
In-Reply-To: <20251017-visionox-rm69299-bl-v2-1-9dfa06606754@sigxcpu.org>
References: <20251017-visionox-rm69299-bl-v2-1-9dfa06606754@sigxcpu.org>
Subject: Re: [PATCH v2] drm/panel: visionox-rm69299: Depend on
 BACKLIGHT_CLASS_DEVICE
Message-Id: <176588110109.2282705.4050268532333619476.b4-ty@linaro.org>
Date: Tue, 16 Dec 2025 11:31:41 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3

Hi,

On Fri, 17 Oct 2025 10:27:59 +0200, Guido Günther wrote:
> We handle backlight so need that dependency.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/panel: visionox-rm69299: Depend on BACKLIGHT_CLASS_DEVICE
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/2bfca4fe1f36eb6618e5712a8b5b41433bb6f10b

-- 
Neil

