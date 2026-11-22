Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333983;
	b=XgAtPBUXJQPp8y3hRFc/hqHb1hSMQnw87GevGMAyHnzphR1mmBdcoJXrCHgPYNXdIiyK
	 atkDC3GJBneV1jc4ZnZ1LMfKXvZwoP55Wqhz7YputJ7ebNsY2JZ6qLRDbY9ea0x3Dwfw9
	 JiWIBTVdIC7FJ7NUk1QnlvFLD2XGr8NRt14uFepW9sBp+45rvP0tEM5X9ZMuOoaccvBhc
	 H7V8jqSb1m6Vzjy58Xo3uEdDmIJ8NNamAyqHVui+MPtlFuBooM4CN/raeq/gQTf+Xon1j
	 /5t2JWGZXap9jCV/4l/fOfJ093reCBPhcxoQAEkjupJFa8gLifdOaOXeBBFmS12YFOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YYjiTYJrCn6f2EJvoqo+mfdpJGY/gBVAph1UiZ3/0y0=;
	b=Uq0T+DJdhx5vO7f+M2qNfk8MgvSI1IE5HTyOsCn9+z/G/BX5PaAfp73KqCmBtwhRpfdm
	 /fz2T7RXSBsF/XL/Wix8C6d8z8rGEO2BHnztMs/waY7j2wm2YliAmLa4WfQzgOULCumJC
	 VN9jl/vEhUBnillSQXXeth7F1ydNVEuJwMCvTVthAIpMWqp8bRKh/hxNgbOqxZzPWkucw
	 f/4XXRhjNNbZJNeCJek66efPTmtzr/z6LTmwWl9IZRkgWaiaQUncIPzllUYxzsl6cHOnn
	 tDLwWjva9jOaFyD78OQquk6bm+su5DgLbUpVxOvHceGl17ZTant/6DSeLDcmqs7gUbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h+PoNCJ0;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933F2606A331
	for <phone-devel@vger.kernel.org>; Sun, 22 Nov 2026 07:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 933F2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h+PoNCJ0
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so3311031a12.1
        for <phone-devel@vger.kernel.org>; Sat, 21 Nov 2026 23:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333982; x=1795938782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YYjiTYJrCn6f2EJvoqo+mfdpJGY/gBVAph1UiZ3/0y0=;
        b=h+PoNCJ0JWrepuHH8XR98IvmKBVK3jVik8a77/KXxcdI+xho07fAPKtyBE92aKj9tn
         GWDIeT5DmnM1y4lTMxHD+riQmVoLL91OSnvno9BuwNERToIHSP9ucObNFPkySX4gtyWX
         540MPWlRqpcsRxF1qwudcehjnTwQgvgqaRkrUHUvOSSMzBIEJ9rOTQW31zP7ES6QEZo0
         gidNU5nhtmKgVnJViP2550SwqgkxpCkiW4lkxy40aAyfjyv1G2wiXJmaOk23ixEcWesd
         gbcKP1zqZNoNIpp2MBP8o8kuvJXkcEtlpdjR4cxUcXjmWTY0O7R4zYzVFROqp56VcklG
         elPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333982; x=1795938782;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YYjiTYJrCn6f2EJvoqo+mfdpJGY/gBVAph1UiZ3/0y0=;
        b=XYcDN7ehegpTSMYIq4Cv6+RsksgdA+IED1qW7bGFL7Oztudbm2ZKfRwhD6WwWJ0/2p
         vfwmXWxs4+2lhjKepgzTBqTSEGRHUNZzeebBGdw5TSuQJEyijynN/qXA0TYaPTkm4YPb
         3iiB7uB8P2UP/tsD494a1zheWdLg5GktD7rgmP3ih8SwmByrSHGH+nlpgxt14uorz9U2
         Tuv5f9Xb68qsq5UubVt899CKG7ha4pCJGCDXRlX7BUCER6BZ1tWBXe4vwEkiDc72PMYI
         UhA5PrDRT5i88G5oxSqwoIZS18W2594Dw9VlR8NJtCKYIfUBhbBPGQJ7itYxNo6V4eFK
         EboA==
X-Forwarded-Encrypted: i=1; AL+hErG65XnLHe6+JjWDohbDevkeS06fUacIZpyotWPl9UnWCI8AhOEEHVOR1W6224MHDZQIZT2rp7udQQN3hA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+2/+0VVdOCwOB4KlVdTInnCsUwnjIv7tAGmZVf26Tk2Xl/gwod
	A2AcznKEV2skomVqvCut0sUPJ46rHBe3vKtsLOxzTEn0llY2HEB2kq1p
X-Gm-Gg: AZFdTZfZ65J4InriyYyy6TF7gYb2qe/Xgqa3AQw63+Iwxg5AYDEjVDbeDclEIaBWl3C
	IxPwfFoVx3iEoDaRCbI3gFOUI4CHAtqdaRZQR0c9t08djPQClRSaHRQt8heNG+ccHkLPdhHLw9m
	p+1yqmkB/e9v1ce77++vfkTCoD+BbTzfYij7vKISR6Qy3HUJYlGlxEejEcLe4CCp8SQHnZVn1OY
	GeuHTyWbaV2qfT7GiB8zo+0NDdgNNluO6nSDkjHgvwoMOAffQhOG8ZJCqVua1WfUUH/sL3rvO7L
	6T9gRFdNX1R2qPG3Og36i+kWPV66931+Q2qzeDguEyyMa+Sp60EovffToQP1Q6c91njx4iifCN/
	2KhL7CLHsIiSXBEiqnT5yuGC5CVNZgCpshIdNLv9hHG0MB4Q9gTfN6lNkA+ztBFIGr+ptYc8oyP
	D2bVe/RZZWZpk45s+w7u+SYfpjqY+sTpVPMXbTQ//FT8G75xCtnp02w1vF3Ncn5gsektyWKByzq
	cWzgX8fYm/E19RG8Z5buKCOLltcUqf1mPbyYnSiiL6DFr1x32BKggAQgcfK3ZDHqRgV4tNfQcvZ
	YBSO1WVkbK/P8Zz7+Jr3CNk+u4s=
X-Received: by 2002:a05:6402:1941:b0:6ba:7be9:ad85 with SMTP id 4fb4d7f45d1cf-6ba7be9aff6mr1735125a12.29.1795333981628;
        Sat, 21 Nov 2026 23:53:01 -0800 (PST)
Received: from dl360p ([195.155.168.55])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e362bdsm3668837a12.5.2026.11.21.23.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:53:01 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Michael McAllister <me@michaelmcallister.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] drm/panel: add Novatek NT36525 (Samsung Galaxy XCover5)
Date: Sun, 22 Nov 2026 10:52:58 +0300
Message-ID: <20261122075258.2919999-1-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179501720308.74840.10845458526829767554.g10-nt36525-coordination@michaelmcallister.org>
References: <20261117173319.1852638-1-tadilhusrev@gmail.com> <179501720308.74840.10845458526829767554.g10-nt36525-coordination@michaelmcallister.org>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Nov 18, 2026 at 03:53:23PM +0000, Michael McAllister wrote:
> I've been working on the Moto G10, which uses a DJN NT36525B panel. I
> have a local driver, but it'd be good to share yours where possible.
>
> My panel is 720x1600 with four DSI lanes, a different init/reset
> sequence, and DCS backlight control. Would you be happy with follow-up
> patches adding panel-specific configuration and G10 support on top of
> your series? I can prepare and test those.

Hi Michael,

Sorry for the slow reply. I said in the v4 cover letter that I'd answer
you separately, and then didn't.

Yes, very happy to share the driver. Your panel is also relevant to
Krzysztof's review of the v4 binding: he asked for the compatible to
name the actual panel maker (ours is a CSOT panel), and whether this
belongs in an existing Novatek binding. With two panels on the same
controller, I'd rather structure v5 around per-panel data from the
start: mode, lane count, init and reset sequence, and backlight source
(external or DCS). The XCover5 CSOT panel would be the first entry, so
the G10 can come in as a second one without reworking the core.

If you can share your mode and init sequence, or a WIP branch, I'll
check the per-panel struct against it before sending v5 and Cc you on
it, so your G10 patch can go on top. v5 won't go out before Nov 27.

Thanks,
Adil
