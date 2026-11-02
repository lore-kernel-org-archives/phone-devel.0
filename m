Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626842;
	b=yXX1Ero8Qh9Pd/brVSZQAY91j+/zEwpDiTtjD5cQZH8MF9+s6IHMjyeZuLXp1CLdjGNQ
	 WbzM5DGNAo7jfT55FFUAW9TccjbMvPMfMvpKdpUdPeqxXbdmMu3cPTRlGVppf7Pb4AJHf
	 leE+tCzNgMu0DuItITAFqAYIvb6dWwg3CAnQ1XrElVVN//TxQMOGDK/k8Jfr1qvH/ZuLx
	 wqhShbQsV0yVhjpg8pDDDdAWDDuaYuZnoSAAQ0FGlIoIwah/WwqeJCfsxtckNKq61MZQt
	 eK3v6ln+FXoLHeLrnzlqOdlfpM/3efKk0FBZLKctG0h+Y4/0HlCiP74dB9m/3PheF3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=8K5TXnmWR8LIG5Tp7mnH1kUMA0OkWMON+TeHwvlViVY=;
	b=jQNw27qJyGCDAcRIkhm+PjM2yV/+o842TWbVabd/ujl4lhYd0JMDtHomvxwNoto88adB
	 CHtZLURD3VGvOL6tW4/896b9ZsdYr2CPg4iaaJhm2Jm0nl3LDiGkTJFp+QKX3xEGjeDnU
	 CL2p/tKrFP7RfZLI/4guFCc7aGRNY3NOsjhhxWAuEZ424x2YGZsQwaxfzenHLV0pB1Skk
	 7WEwQwWd9GKJlQFpQxRf/jXTzuNWBcq7Qyk+vKXSPLrn+RszjURN7ia2L0/TpmCB5Tbn/
	 Kok9prjDJwQ/Sj+PfDV16CJZClNFx3rdXQOGeCeAJN/EfOe9nX0QtTOhNuuavj3SndQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=I2qGGkHV;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28F560A2626
	for <phone-devel@vger.kernel.org>; Mon,  2 Nov 2026 13:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B28F560A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=I2qGGkHV
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so26296305e9.3
        for <phone-devel@vger.kernel.org>; Mon, 02 Nov 2026 05:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626840; x=1794231640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8K5TXnmWR8LIG5Tp7mnH1kUMA0OkWMON+TeHwvlViVY=;
        b=I2qGGkHVM4HOQZrV0J9GsfZjA1PIAXAjcif1FjfLQhtZnQs4/DCNQ/EY9a5LgSrzgJ
         Z0DSLQsudURUez4E0NvnsFmBHuSDyc6X+eaTj7IxYPC2h69jy0iO7Gh20XAewo/iBLzm
         GxMNurdLGea3F1McaXdinIeDuCpkfqgRAri9wGBroMPjU3nzOFceCtR97AZhPgCZk1wu
         gwPuXoDMC+ifI9WHgnrBvHvxVfb+YyOwjKyDqjBasw3ovSkk7JW4b8hrNOIF13b0OJAz
         eA2v3FUVws+AirBAw+ekXENF4yDmNP3UcD1PyTwMSIJPIqUhCWpA60w/4OPEa7jT8XrM
         rptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626840; x=1794231640;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8K5TXnmWR8LIG5Tp7mnH1kUMA0OkWMON+TeHwvlViVY=;
        b=YYUox1I0hjti9brjnx+AIYgY+rWur9zeCxJLsaQ8C+pwkTez+WBXF2wldVhF1bEVQr
         JOZvGG5m+T6XhrXj+MePA+yTp8S2pEB1N/hqVXy5o7kjVWNLojo6krLFI2Qx8H3XpFld
         EQ1+uCoIsUze22xhNqkymu5Vew/a/u4jFwZwa51iVaoKZtoOrvZhRhK/SksyyOElZLjJ
         fLh/IiPrywyzRxm6Ij98j0aAy0rB8G4WeMSv5QEIkGk2MCoESkwyTGQ+7I0awnneKTyT
         NFLetW+wbUmah13JmBxZbEU7ouFC5zXOOS8qq77Fk2X8oXHjlqlYHnCLdxrzy4YzfbBZ
         ZoFA==
X-Forwarded-Encrypted: i=1; AKwUvByej5yHBFxB1S8NDvLHx7QJE6AYXoEnbu1l5UB9E9j0RUTIfmib3KM79vzszY8B2iCNnfyL+JzELOX/9A==@vger.kernel.org
X-Gm-Message-State: AFq9FYKOYG4JolrIWFkyuJDak2oG7bFv8c7MsIy+mr5FdRSBgH+P7GWZ
	DQNxHWpeB9G7PB7UHmWS+7GoPExh/KJ7iimsZstgLMmacWfPKox3GSlPO8sEkJLvFIw=
X-Gm-Gg: AYBFou1TF9VcVbcE+DHZZuHEQTXdchmVx6Gh27PxvKIUXDZEO+1NOzSdn8cDfdE8VZ8
	PRieJR0l4DezjSZAcAk4ebMvEmFa1r/weYyCFaXAZqz8bwLPfb57nzB7NIzy6EDyBCLl1xlvImC
	/++Nr1bhWTPCEstTUKrSACKEhAYL2V1k75lcLHUwkFkIiDD2iD9qIKDkcKSlBKgMgRLGQUIakei
	YqFyUxFpHOvJAiqGH9MY6pvQhX5Fk0pgqZeBG0eW1NKPzl2d47ZFuDAkyUTXAmtTcJQxTmeIjzt
	KlqbKPuTwOahws9KWrZ2VQq0/3xbFOHXATieOCryWcSN6GmKxMzqj7Ez6mA0Y25WLtvG6BYuI2t
	0veZfYhEkffR0UejgEkB9lGYEUcJp0RHySUNUNlCycyBKutNtCB+OUg+LMvThUqhisF3FId090Z
	RJx7DyTParCVU5AOlUxfHfP3h1rvV05HmrCqLKIJLL9MnlEd8/EvzbrXQgE/cOifk9RdlmcDcKs
	eIpRQcbQKx2lN3q5UNI3gm3AO3vHhUZillIBlWxqkepH2l93ePLo9MAzh5KCYCU8ON7NtUq7Bkr
	WT3e9jf/x7nzVuZHq9YHtcXSBthEOEseaqsrB73eO8otmFo3DQ==
X-Received: by 2002:a05:600c:3b2a:b0:4a1:fae5:f2e2 with SMTP id 5b1f17b1804b1-4ac14fbdd04mr230324575e9.4.1793626839961;
        Mon, 02 Nov 2026 05:40:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:39 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
References: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
Subject: Re: (subset) [PATCH v4 0/4] Add Novatek NT37705 panel driver for
 Fairphone (Gen. 6)
Message-Id: <179362683894.3310106.5892756542563969007.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:38 +0100
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
X-Mailer: b4 0.15.2

Hi,

On Fri, 09 Oct 2026 13:24:59 +0200, Luca Weiss wrote:
> Add bindings and a panel driver for the NT37705, and then enable display
> on the Fairphone (Gen. 6).

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: display: panel: Add Novatek NT37705
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8ddbace1197498d7e32d36db66641b7e1dff868e
[2/4] drm/panel: Add driver for Novatek NT37705 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9ffe0df0262b573c276cc17089d15a08b9b4306d

-- 
Neil

