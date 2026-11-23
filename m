Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795457842;
	b=DG0sRM6p1QbEd115R4eIjWuPfIJKzN2CAHVENXKBcWv123jWumzpFXmNnlc/8hD8A/k2
	 GovbHwgEbTwSm+17cZq4QZSw9lkmLyFLxTx3oxbs8V8g8SII0WLD3RKInqU0kIA7mOCJM
	 vpEBptusqYjjiqeePGoxk0Qgpay0W/QQqQZHuAD4r5e8YU2IyA2Q2NskHmPpaJE5jsPqf
	 VRuzL6ZzrQs+a/aW3M+WfL9tISAB6YyGo5YmoghkxKs9OnRiQgn5vQsW6np/ih8FQd1Dp
	 VlUxdqD8L2OTju1BTQQSoliZ8kw7eo/SeAXEKHVgW+5Ij045iYsCItv0hhIfByRlj4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=nutOLNh5W4dTyqWoDODtl05Z3AwT5FmB7YX35PdwCns=;
	b=fbLzZUwTqtffQv1I75snJSisgqq7l0y/aYkcvZF3M/hwXKMOdEDW5QE3VPZe+qX2MbC6
	 McXQ5N0FG18nL4FsEmcDK1QVG9d0YFEilIwOqblnBhwP2L6/QpSLzVa6WnlyofWvF24RJ
	 vlQ3y/kHb3lFimDkWUwmiUJNJiG4YP4F180ZlJDZL7GxudX6EpOOWx23BS5oGMBQdt06H
	 dcgOvDLWWdnnRYx4T+66lPKcRaQzylB8MFbpdoYBl1yb1B99kXgU6ybZU+DXVvomTYnTr
	 F17fsFHnlxJ0+1xpzMQ2OwJBeFAe7/cRbWi/U2DoNHX1m2jr+tlxF3OWRJMVl4TnDbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rAYH/KsP";
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C55606A31A
	for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 18:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28C55606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rAYH/KsP
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1536002c88.1
        for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 10:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795457841; x=1796062641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nutOLNh5W4dTyqWoDODtl05Z3AwT5FmB7YX35PdwCns=;
        b=rAYH/KsPQ2r/RcXZrUUK/+RyNmCDADQytEDNpjaMcCXTfiXyWEnnWAeUTHlbeT1h/Y
         qHwaPsDQAmRjVTxo3yHP/ZxdK2d1pQPZJTuRho+pPQ54PpswU33GkPgAhpInghjXSwrr
         nTGajwtB+qtkURu4+ZKSqSL3sh8sqJhc2yEryyEwGVpB7uIOdec+bJD7aF3syrUVN8Xr
         aye+4YEwqCu4SqRp+p75soLvgnuiZ6sRscgSsHz44gG7pV2rY0DpCQ7KvVAhkwx1+C5U
         dh41FWY8UzlZRHj+N1E6SmqbM9tBGQqKhbGxWZ5SH/nVYnxMMFCwy3o3GYL116ewZSfF
         uNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457841; x=1796062641;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nutOLNh5W4dTyqWoDODtl05Z3AwT5FmB7YX35PdwCns=;
        b=AWUn/4criJ+ZU2SY8Yn5jnJxGyc0ODTj3v6Dpsz78FlVfXA3O1wJrLwt1tGwBAiAdO
         LBhZ9tw7uhzbTfyt27k3TUeIIYno4h/nrTK7yBvq3EyrXCTdUFj4bqmsobrTJIkgjtxT
         WYz8qt94KpIDOAuuaso0UBsoDqyZDp21r/6d7fNyphD6NvJzJtSvQrpeYKVt4o/+VIUH
         65qyT3/c8vkXtHMoxJOkgJ4U6pqQe4zOI3gLDQ4qICi4d1Op27MYHS0E9AykOfRSMEqV
         lTpMxIPRo/DlsD1ojbcW4X9fcxrM23DONYAjB4fy2yAo2Y17MKD5rrL1aFk1jVJjKHrM
         FVjQ==
X-Forwarded-Encrypted: i=1; AL+hErFMqhN6zo0SxfJDQMZXaiKi3lQjoJtDQprOdbw1tHp9bD0qxBmrmxXmJTUvyE6eGCil1qjo/fSD5D6J2w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9I02g4PZuylCO32AE0O2IxMpkNHZaykUrJ7mnm7DJK5uWk4Bjm
	8QRVnNauL/Vz4jJe0+T6Ks1nredN2q5RghCYx05ZVWD/eWVXd1IbKeNY
X-Gm-Gg: AZFdTZe+m5FTi50uFNvxe6+DOmPOcpVMYyr7ybQQZMNATYj52h5kzWhB6hog9GErE3x
	F5eBk5irD3KIdTrKbB13TdhjC3TAOsiPcHobvmp0aQAee6R76FpXUP7A1iA2JPUoDjb/ljN31nu
	mjFL5iEjbk3iallgQLyP5fQvUoC3r4bBTvDOZpXfZLGJXHDVhkSf8b5CURqZJUF9Q5Zvkze56xn
	0zLFLjSEJ7jInmR1o6gbGPeTqpxL/vLE9TKhnzCaNVz3CSF+oP6xV2jP/+UWEO2VJ4AGr7LQTWH
	/dQIypXe2L9GJjXYC7cVzruvRT+UsnI4Gm2UqctlRpGSUCwbsokg/sz+szqa52XN5sTg101fi06
	/erSs4sYl3ZNsDSHmTDtDftKX9BneNP6ka+G081YMwzcH7BM7dKHQbirASCrveM5lJaX3O/hcGd
	TSoHQQt6A7dACjuRkQ2GDyGGSbgfYxdbmZJbHn2x/62sPTzZwg9K4nWWfM0ji8dEle1lkoq7a88
	2rVmoc23zSj+Dz0FWVc+TEINNasDbwnRjlqcU96kbLtDguCqCeOEWhZl0uOQnIyA7M5w7rEVA+w
	wLsZDrjadWn0xxBNM3LoG5tP4IBq0tgFyU03RdWgSTr20e6abnPG1GX6y48RKJ8KxneOxvP1
X-Received: by 2002:a05:7022:1703:b0:1b5:64c0:d2be with SMTP id a92af1059eb24-1b564c0d31fmr7645119c88.19.1795457840287;
        Mon, 23 Nov 2026 10:17:20 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm30439137c88.12.2026.11.23.10.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:17:19 -0800 (PST)
Date: Mon, 23 Nov 2026 10:17:16 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andi Shyti <andi@etezian.org>, 
	Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh@kernel.org>, linux-input@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH] Input: stmfts - restore touch after system resume with
 the device open
Message-ID: <awSDI1T2DjX63HlL@google.com>
References: <20261123-stmfts-suspend-v1-1-4b2276879e8d@ixit.cz>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-stmfts-suspend-v1-1-4b2276879e8d@ixit.cz>

On Mon, Nov 23, 2026 at 05:13:41PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> stmfts_resume() only calls stmfts_power_on(), which re-initialises the
> controller and deliberately leaves it in SLEEP_IN, assuming nobody uses
> the touchscreen yet. That assumption does not hold for a system resume:
> userspace keeps the evdev node open, runtime PM still considers the
> device active and stmfts_input_open() never runs again, so the
> controller stays asleep with scanning off. On FTS5 the controller
> interrupt enable command is part of the runtime resume sequence, so the
> result is a completely dead touchscreen until the input device is
> reopened.
> 
> Factor the scan enable part of stmfts_input_open() into
> stmfts_start_scan() and, when the input device is open, replay the
> runtime resume sequence and re-enable scanning from stmfts_resume().
> 
> Fixes: 78bcac7b2ae1 ("Input: add support for the STMicroelectronics FingerTip touchscreen")
> Signed-off-by: David Heidelberg <david@ixit.cz>

Applied, thank you.

-- 
Dmitry
