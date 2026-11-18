Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017212;
	b=vjwFOW9Rlm2qwGWbHhazTonQJdi85QVJZ3TuubrpJ0u/6FGR0UeGEB6M+n6nTwdB6Xqf
	 e0bVspwlJS7fr95H/DyhesQ2Qagf7ROjflY7RbhcikVY5BZJZNvB6oqk5pEFDnYu0F1W7
	 +Q8MMjoCB0NhUIiTntRfkwUdF3yPggPaTvulebz/x9H7KlBWP8+7P69pBDRl/AI2hP491
	 7856mW3phPp7GRVu+juoKvA5582vX4ocp7TvnDCPb0n2F4FqIvI1lPIObDkKHF7MQlcK1
	 Qk4mYuWEA+UKXpAT4+L1yq0OjuvEC6Y0UyKMmT1PRsbn5KU3eyYDHlOelMlw4RVBHvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017212;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Jv01MUGM1QJuBnHIB96rkf7JnQKaC3rvwn7e76mZ8n4=;
	b=m0TrQW32nN7DTTE80cmoTEjTt9IpLS82MN/htAw01b1khVAvfYh4O0m4g1v9FV6p09wO
	 NADyJ6bG3bZoN3Yv3TFhCeDYe1uwRTYynJsSSVkwK/N6qCYI75hfdaL6/D1jcwByAKAj6
	 IGJa5xY5SkQkREl7RPaSAPakqhXfiFxgL7A9pHQb1DTJ+sPcBqZfMePHbu+FszAv5aE9Y
	 GDiJcUEozzNqR6N8nDfvlNtJtDOLL3DcUWYWwYNgyj43GY8/unJjsWuK3+sRX7LrWgVO6
	 4js/HCAJVIernrDMZt2X2s1I/YPUIEdPM2loAkZyuim4EusdhIOL5sVE/ujWesEeNSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b="If6/L1/a";
	arc=none smtp.remote-ip=185.70.43.171
Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE01606A325;
	Wed, 18 Nov 2026 15:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BE01606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=If6/L1/a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1795017209; x=1795276409;
	bh=Jv01MUGM1QJuBnHIB96rkf7JnQKaC3rvwn7e76mZ8n4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=If6/L1/afFXCFOtGJ5apCOIEmMufwwnk+b9k7kvgXkpk5p31wR2WE6VO5/MVixibe
	 MdWsEdJa0KhAVCSoNsi0d4aydDWiSS99UU7Q2oGUFGcrD4YJMUMbASLglCTWQie2Ri
	 PeXmZaF/cNjnNt170ritfAFcAGUTlnCeUFUkgKqpuMJrWOOBgNqpdtqHAdKkKIa5D1
	 KQb4IKHHY1kr92N1/akNzsyPEGLFXRnhqigYsUbJvp//pOVNncU0yQJi9LDSVNtDnh
	 lQ1XjlskHIin9RCMWAePYIfG37GvVRKVgeJ6paqDOJmEGGBl0NvPciJCfWJHlw8lMC
	 grOvDNpC31opA==
X-Pm-Submission-Id: 4jV5jc2TRTz1DDXX
From: Michael McAllister <me@michaelmcallister.org>
To: tadilhusrev@gmail.com
Cc: neil.armstrong@linaro.org, jesszhan0024@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject:
 Re: [PATCH v3 0/2] drm/panel: add Novatek NT36525 (Samsung Galaxy XCover5)
Date: Wed, 18 Nov 2026 15:53:23 +0000
Message-ID: <179501720308.74840.10845458526829767554.g10-nt36525-coordination@michaelmcallister.org>
In-Reply-To: <20261117173319.1852638-1-tadilhusrev@gmail.com>
References: <20261117173319.1852638-1-tadilhusrev@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Adil,

I've been working on the Moto G10, which uses a DJN NT36525B panel. I
have a local driver, but it'd be good to share yours where possible.

My panel is 720x1600 with four DSI lanes, a different init/reset
sequence, and DCS backlight control. Would you be happy with follow-up
patches adding panel-specific configuration and G10 support on top of
your series? I can prepare and test those.
