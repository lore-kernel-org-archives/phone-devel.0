Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203310;
	b=tigjF3T9q/+ALsWBkUGIGXtVZxUZ/LlSDfwu9BDPKxuDgUcHBspIpS0OY7xrhNfeqlOh
	 tG3qZOdDFsdJRpEthfK8fnsAMOTps9N5aMgsWSSCPrSZ8so+PHjk8up4D3rQOB5pCegcJ
	 KeKC2GN3HqkR/r0llD0HPcTkWGzwmZV360IZLqLbqlcUYT8h9BuN3D/kzIfP6rIezYZRM
	 ARWgHAQh6WIiBvgUu07ivv9XgQ2EaftmIQ10ryaH/8/TLDiVLr6QCWfl97H2IdLKLHObF
	 F5Od5bLR3h8XBSQrH4tcZ8E1BvZHkrWPSjFAo10cZJ7Xd0HL8TnTnkOMCj7caYvmxeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=Y9j+sfcyJlHzWCWIOd7Jp6SUCd7X8y3215Fj0AMTPmw=;
	b=bfbmO2VjYz+g7k8q+9B5RIc0pK3kEPIlDIzDXPIu1fgy7iYEtgohCBkIM26SHpYLsgwO
	 r0JdtxqmUI6tKyX9H921+p9TaXj55ASBgiuX5j4e1bRqTrhNH27yEUnX/foYlMCK6HHey
	 qlUsKME7bo6mF4yZyTX8N8n2rkL1TBB0tKjTjaHVsu2D2CVflg3h3Wu+O0/rZfZi51174
	 i/iEnPQtmY6kFDmR86In4VGyVNJ9Cxrtwc6nI1Rsh21VxruoCghK1q4maXMDO/gyvKihQ
	 zcrWGqIJQm7wtKDT1iho9a6LYyM6TMLbqyiUU4Yr1lydepKYOi0LvuczB2MjFmcwJtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=urKzB0dQ;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1356B606A323
	for <phone-devel@vger.kernel.org>; Wed, 28 Oct 2026 16:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1356B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=urKzB0dQ
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3aca0bf7fd0so4350041fa.0
        for <phone-devel@vger.kernel.org>; Wed, 28 Oct 2026 09:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203308; x=1793808108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9j+sfcyJlHzWCWIOd7Jp6SUCd7X8y3215Fj0AMTPmw=;
        b=urKzB0dQZngv8w52Y/SEJTEvquwyyzQ8XBJr265/0KI7h1FcyUjonIhOqODqQh0R4k
         +03Dd1tse+YTkgj6jDRNwV97decRreWuQ08ComEaj8fcbyy+oM/OhhcDMLlF0Hp4nTTI
         wqNwnFgLTAGeJSbq0TBgvRvLb2iBKMzaoqapwT8hqtWeh80WOLpoCJ+gWfzxX5gyQHY+
         b/+Vu8AC/MY4p85a8YDXkZNugktoZkrBagbkkQeCDew/Oydv72iH7BvVlOOExIGzGUOw
         vtehYfnCFJrCkdNB9UWM1ew+9r1Sa4vKpdXUjSMd61kIlsh1ZmpKNzY7cELr3lypoX+w
         a6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203308; x=1793808108;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9j+sfcyJlHzWCWIOd7Jp6SUCd7X8y3215Fj0AMTPmw=;
        b=S72exVDn8Wivwf7xmtD+mScEYOCSf0vdrEKqbsQhYWr/sykHaeAKP2U6ORMCGPBjgp
         o4E6DZ71IaKh9LiSHcFvTnPSX3mrXHDVXB0/Kh4Rl/nxTdYGLOGl5XXM3n1KdXt0MBjx
         +FdMEZ3Yb7AVnggyFZXTJGgMJt5B9k6rvmrkR4z09YZyK0k0O5mj6KgpCkcHkHV1Xyff
         zJAqvr5pOHTaE7b+tzRRcSCSszhXHJgKFEUDWa7OEZKhSNBEGy8n6KPyxemvCkv3Lin9
         jm4fMbIj2uvE5NtbX7T4Lm0H4+1PBcAato3Y2GHy5dZkNtj/tkh+4Xt9AUSvCUSNaGR7
         ToFQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4psQvutL78gOyd/reWiT6PueXL+PD9N8MhGOIasyshO0BDZYSIkvceDA/ax0it2V4kYPnbS0ry9yPQA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJJpUMY1z1SFsa9DCMGw44oxA+gtXgkAaBypM5PqYDRoi1q2gPd
	cFmgG5e1ZKJMXWY1RYSzMz6ERYVZiNO69hX2xZQsBDxPBWOQpt4VuxwSA2HpzBUJsgCLb8AGCKw
	cQa+VTfo=
X-Gm-Gg: AYBFou3Ucef+aHmobGyq9X27lJ2k0Dt4P5QOVEq/YiR3P8UWHW+ePXeVLv9/8TfnQmk
	43P8FfCQKRMxe0a2GTjaNgrUewCrvGgUW26otqLigC0KvXl7S63pdOfERWgMo1eJzv4N3h+vCi1
	gJyyCF1hV8Aa9tnHiWMVb0NGwAcyoSbUtMFpFCfu3hO51lw0XS6Hg4B5n0aA+H/9FTTIpKw80WV
	dp86AguGAh/pOzdY1rOM1AUdCB0FrnGNjLaqD9usa04DO+A7hamiTVGBOrEApMLDAnG8L22EtvZ
	d2eXAfdiimMXo6sAQN500LTAdadxODTlNuI/I9AfdKYI+87GSDphqO+SWhkxz4hLib36+ETIKcV
	h9p/n4gnlWOovc+79KYBfdawv7PZqgjc12LjWhyG6ev2oxoP/jnVbshFan8PH9FX2GWEjy6GapJ
	NqMMN5VIsWUFXyMxU/4fvHqLQHMI1ZX5VQbcXCvF4Di/ghaQqokqa7S6oQEwnXFZPL1hWUkOj9Y
	AvkQFnSWVRSEXRY87P+M2p+UEOVWFOauaMOo+yORKSvY30VDG+OF4/q4nnNpgQsFW9v8O2kaW2p
	cASbq+yFYnrx2qrTGs40oIy7lXT1OSNK1ZT2u4WMphnULhu0GIecYAME1qBZz7dOD+jPxHQ=
X-Received: by 2002:a05:600c:609a:b0:4a2:9cda:57cb with SMTP id 5b1f17b1804b1-4a963ffb29amr58143835e9.1.1793203297305;
        Wed, 28 Oct 2026 09:01:37 -0700 (PDT)
Received: from lion.localdomain (p5b29ef1e.dip0.t-ipconnect.de. [91.41.239.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80286fc6sm1686155e9.15.2026.10.28.09.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:01:36 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
To: Sumit Garg <sumit.garg@kernel.org>, u-boot-qcom@groups.io, 
 u-boot@lists.u-boot-project.org, David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Tom Rini <trini@konsulko.com>, Petr Hodina <petr.hodina@protonmail.com>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 Balaji Selvanathan <balaji.selvanathan@oss.qualcomm.com>, 
 Jaehoon Chung <jh80.chung@samsung.com>, Peng Fan <peng.fan@nxp.com>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Aswin Murugan <aswin.murugan@oss.qualcomm.com>, 
 Federico Amedeo Izzo <federico@izzo.pro>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>, phone-devel@vger.kernel.org
In-Reply-To: <20260904-b4-sdm845-usb-gadget-v2-0-cf1baa65a6d4@ixit.cz>
References: <20260904-b4-sdm845-usb-gadget-v2-0-cf1baa65a6d4@ixit.cz>
Subject: Re: [PATCH v2 0/4] sdm845: Configure USB3/DP combo properly
Message-Id: <179320329583.1454330.7412906293709750636.b4-ty@b4>
Date: Wed, 28 Oct 2026 17:01:35 +0100
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev


On Fri, 04 Sep 2026 19:53:43 +0200, David Heidelberg wrote:
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
> [...]

Applied, thanks!

[1/4] phy: qcom: qmp-combo: select PCS register offsets per version
      https://source.denx.de/u-boot/custodians/u-boot-snapdragon/-/commit/0cd30ae2bea5
[2/4] phy: qcom: qmp-combo: add SDM845 support
      https://source.denx.de/u-boot/custodians/u-boot-snapdragon/-/commit/2c7958df4dcf
[3/4] power: regulator: qcom-rpmh: add PM8998 support
      https://source.denx.de/u-boot/custodians/u-boot-snapdragon/-/commit/60111319e459
[4/4] configs: qcom: enable QMP USB3-DP combo PHY
      https://source.denx.de/u-boot/custodians/u-boot-snapdragon/-/commit/8c2aa7fabe5f

Best regards,
-- 
// Casey (she/they)


