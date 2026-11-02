Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793589534;
	b=HvL3VyBpEcKxLXTH/GnXyx/1ecSDKPvfCHJTaPjhvaoDhEw1+D/pgwPeTfRhh/yfwcsA
	 9Kw0ah9HEQpyolfCrczyyjjyUSdmO7VNFzhtlJIPaA/aKRsiUXpqVNuOZL+j+UisIGzPq
	 t2rMVAAKfSU9RUQ8P0JIvp2t+KBOhenl5Pf+/ZRsojzfRFMigInbKclF1j6Ufp1NBwJM/
	 esMYe2JaMg/j2RhJMnYfIQZJTRe2UKaBs+rwOT5Pze/gxOKnFT2KbuNvza/mKx4Cn3MeL
	 Wm5Zl3/AHCiKSlI49QFfZgbtzdFLyIB6hJ4SWUJ+16qBK6AU5V+EwK0/45ODywZ5JxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793589534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=nJCnzPlEYPTpiPpNwhFLsc1nTWFuyJzYXd5f4tSr6oQ=;
	b=3ewC3rOmV96S07Uk8YttQ7hzF3drV4In1lQ3Z/f3n47xcuILwDrxzr1Erux2SRhkYONe
	 LSHq1HOASquVYK92vQFngWWM8N/qxYo/wvEHBtzP5Y3r8lXyKELe3q/+1xCFF0sk9ufZE
	 dxT/qucSpcT5Z0nDqNQoP405Jt1pmrURkaY9ciX1wjn3E1ka72GHtz+gVHs7sY1Ebf5ZX
	 0Epn/QcU2ry9Tt/zWiI7rKIQQmZIfJdmZlpvIV4pAs7pnSh/H1eIaJevVey3P1N4R8owa
	 x2FHDUDuVxNV1FFow3Nha+LXQQWxwUfZk3A3jHwdV/hJa8tGkC85ITf8NPW0u+BsEOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HzdV9ohT;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324AC606A326
	for <phone-devel@vger.kernel.org>; Mon,  2 Nov 2026 03:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 324AC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HzdV9ohT
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1931ff67a29so4382251c88.1
        for <phone-devel@vger.kernel.org>; Sun, 01 Nov 2026 19:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793589533; x=1794194333; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJCnzPlEYPTpiPpNwhFLsc1nTWFuyJzYXd5f4tSr6oQ=;
        b=HzdV9ohTmNFyqmLLsDCqmODyoy6Sx31mv0ijemiLjdQg7hHw0X40I2CBE+mz0w6uWC
         aNYtC6Yu5CBBGxnEVhvE/Y4P6wEZVejk2WgvWSIhziXfRTXvLOnmEUo9UxTr7iP4XE/3
         2eEplDFJDBFyraV/0AW3CWGNlYcrVqQIpT2k2nOGcHrMMk5JghogbQjvZYX+UKpoAakp
         Y1Cxg2O0X+lnxVEt7t0wL7ZtoESdT4GuM4+mampJwV4M+gY1pIlnVR9DJfvSBaw9QIpW
         NQcWRXEroXcZLMc6vUr7ZvMWPYeFlup5uPOXrbCj0dmNQE52XCFrdmOQbDZhTClfxJTa
         y+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793589533; x=1794194333;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nJCnzPlEYPTpiPpNwhFLsc1nTWFuyJzYXd5f4tSr6oQ=;
        b=E4TebKfBLzG6Eu6gCBcLoW6YiRov9TcDr0VhJXJNL1nKPn7nlNQCYTbeFtaCZ58HDR
         Cn9QqC0lRkEPryWZ38n2IeAAD4IybtT7h0Aj98XYMEru5rDoJmjYX/TfTY2CQ4D9MDc4
         CwwTrBxhbh/w8KFMmSDU1lwdpXoJDEstBbcNo2eMLNDCtd1iGIDpOL8rMhGkhhot14K+
         fxK7cOuMJO5Jdrpx456dBJa5gT9f4owER+/6jX6X67YtgnoRX6NMO9E4NyNd+QeZlUDt
         V6ESUQdTNeNR1s7FVig+eUbzmPRG5FYt/NXAjQcUBVW8xMerXAmY3rnTRdp/IFO6+mNA
         mzYA==
X-Forwarded-Encrypted: i=1; AKwUvBzWQficGQbQqfjvQFuQPg6kO6h8yUFPAzNmhgQ8otkY8HQgHf0aOmCAhMww3S2hyK4ZNsAygOYRrO1y9A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+a0G8bl9OScz4/MY9+ACZxJcVdmowcKvDd35Ht2vAGjJ9SuqRR
	/UHXODzwlQ15tS8e7RNguYsNyW2Tf2vFzeQcWKpAddTVWs4375/vTeXU
X-Gm-Gg: AYBFou3clY9QRPbNuecI+M/w4udPq3SfQQXHvDTDCiwtiQ7QpwsB3IYCMaY02ZT8j4I
	7I6oEjhD0d268ZWWcBsifiKfVYZL+Tp3iJTKyZnqOAAvGhsi+I/bqzTqU2DdBk5KWTJX0yEwkaW
	3Ye1JCDhwib1gTr2oJ7bPBEwFzskq9pd2y3ES5nVCslOvHWG5PsP81gMys9CU2CxBXEJkMgmY8u
	rCe5JKjfmtjOaQ0Xeqt/t5v081Yh0Ayj+lxLIn3kdKk8M9wEWFoG+OGcFRzYXJ4iAOHFtKUvnpi
	sbVx79lXt2gE0T6UdFYz0qSalR1ZTR7R+7woHOJ/Eg8XrXE9zYOBKGjdpyGZ3Dx/69mtx6vBgmd
	h5grBp3j9O1xV1gkWTphSXTs4imjl/xkDa7y+0XB73+WwPLb62H0i9tJ+7+ZsqOROTRNT3Lv87I
	unMn3N+aRpcsR2Zvjjw8pfSklPFKOOWMG5Pd6EOXq/LldZiuKYrjhhKBVzcYQN5DdI1jBZ4uvi4
	q1/o1dvIPGXKPWepQg+T1v7a+lPMth30Aa4WXJKWtPamb8dlBbAmYiPtTfy+o95+6tw0zCwBMyM
	EXnrKNKcQp3XMSgro/GMCUV2iwr5YvhRl4s4260f1d7YjRfvcdp+KAfOD0APbAt2AVr/bAg=
X-Received: by 2002:a05:693c:20d0:20b0:36a:112d:fae3 with SMTP id 5a478bee46e88-36a42435927mr13964731eec.40.1793589533040;
        Sun, 01 Nov 2026 19:18:53 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:d75c:a9d8:6c00:c5c6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6eabbsm33411882eec.24.2026.11.01.19.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:18:52 -0800 (PST)
Date: Sun, 01 Nov 2026 19:18:51 -0800
Message-ID: <4590302cb7f26ea6173018f5d7083977@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Petr Hodina <petr.hodina@protonmail.com>,
	linux-input@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	stable@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v8 0/5] Input: support for STM FTS5
In-Reply-To: <20260925-stmfts5-v8-0-0fcf49e2c85f@ixit.cz>
References: <20260925-stmfts5-v8-0-0fcf49e2c85f@ixit.cz>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi David,

On Fri, Sep 25, 2026 at 11:22:18PM +0200, David Heidelberg wrote:
> Used on various phones. Minimal viable driver.
>
> Includes device-tree enabling touchscreen on Pixel 3.
> Also, tested on Xiaomi Mi 8 (device-tree is not yet inside the mainline).

I applied patches 1 through 4 (leaving patch 5/5 for the Qualcomm SoC
tree) with a few small adjustments folded in:

 - In patch 1/5, added a missing trailing newline to the reset timeout
   error message and fixed a typo in the comment in stmfts_power_on().
 - In patch 3/5, wrapped "const: st,stmfts5" under "contains:" in the
   allOf condition so the check keeps working if a fallback compatible
   is added later.
 - In patch 4/5:
   - moved ABS_MT_TOOL_TYPE setup from stmfts_setup_input() to
     stmfts5_setup_input() since FTS4 does not report tool types;
   - dropped the undocumented "stylus-enabled" property check so stylus
     contacts unconditionally report MT_TOOL_PEN;
   - checked X and Y resolutions independently before applying the
     10 units/mm fallback;
   - added a check for !sdata->ops in stmfts_probe();
   - fixed the GPIO name in the "mode-switch" error message and a couple
     of minor comment/log formatting nits.

I will also send out a few separate follow-up patches shortly: one
teaching touchscreen_parse_properties() to parse touchscreen-x-mm and
touchscreen-y-mm directly so drivers do not have to open-code resolution
handling, plus a few fixes in stmfts (not aborting FIFO parsing early on
non-touch events, validating the 4-bit slot ID against
STMFTS_MAX_FINGERS, and switching coordinate reporting to
touchscreen_report_pos() so axis inversion and swapping properties are
honored).

Thanks.

-- 
Dmitry
