Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557802;
	b=eg/Ha5JKv26LidQ2JOlUbgbUy5j4+EWFAF/tYv4+FAovtw5rLirySyB0ZiFgJ/5QDmnu
	 wuaHsWXSs6bWE4WbdT0f3B1esqeEf8qEJKI9y7IdgDkQg2XO+iNhj7Fk9yWpKi9qIz84V
	 BqGITM3HlPgNGule8pzAwsvJIkCykeI3kSYZKa7jefK6NE3+ofeysHyCqIU+j1zZfEWaL
	 j3k0KKNAIvi4CQalzmoFEGVbZ9RCSSe4TigVQmU2UE87PW9fAgJeQHl2ZehEm8qKKJbYZ
	 1hF9H2O9vjA40v4x+5iupafGJ68CCKKBIpZgFznfx9EE96lmTmWHYMBfjuOqgP+gnHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xteIZdPAt29TQvnBYpNhyztO/+db/w+uWq4mUr1II3s=;
	b=MvNowqb2tYOTS34BHFlrUftkgpm57M4TDIYt7s5kvQpuL8kF4N5H3PrQdjD6rx8WyBBC
	 zfQdeEjCj12Hi7236TsuFzjHtYzoN3uEtxA4kaE5ksVLyrBybnIubLlbwPYNW3OhDn/Gc
	 Oyz/4lVEnlooqS75YVULRpRt6pKjq2MsB49JPloG2hpln3uSpinL7pX+HGf2gwQRT478H
	 v+yoz6radaw4f4W9Ij4URRDMsGpPFqF4fRXDhCFV3lPte9r3jBzEfX1g+ae9uLYLgraN0
	 hI+YTA7GcpD9efrF0PG9iPn8mRoBRlVxxwGQkDDt3+JXphH3FEG/N4XGO9HXug7GHJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=M+i9Sqh6;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D29606A88B
	for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 08:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1D29606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=M+i9Sqh6
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c247f6687dcso152614966b.2
        for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 00:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794557800; x=1795162600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xteIZdPAt29TQvnBYpNhyztO/+db/w+uWq4mUr1II3s=;
        b=M+i9Sqh65cBeC99GKRtTsjvKA9eNz0Ojf3HZlQQLVFkDeHuf2fyP7xQj7nwPBTorfr
         BxtJD1FlwF/J63TjhMSp0XKAlMq78yP9xnYAcjtnPaEou3Uz/4gxonmqi0QIAhlN7rlE
         Z/VoHH1aID9T9UZ04qrXheKbcAfkDMeAecv5xTFBBXgVWfjjY8yCBXYQGJvStlQiFiN1
         rQlL0C5I9R5Eq8iz+D8sb7u0+fINDGe8S/Adw4/w7fLuHcO2P10u/9CAFCPL4F2SSR5l
         vidkkaVmfhAftFhuOKgymjFj3RQvbGRDE9shADZLkTh3i68BX4NFKjwYdKBK5rHZ+REe
         lQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557800; x=1795162600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xteIZdPAt29TQvnBYpNhyztO/+db/w+uWq4mUr1II3s=;
        b=FN3P0u8bGPoIlLgjhRCbwaRhyzavSQ+936/H5I1fn90eWr7qtmcxURhIQfmuvFmHJy
         i3uuf+BL5+r434nMXsiB/5Kx4zLKMwfll8570gN1zywk9qRUtQI9DMdPpqzkdQF5Ebua
         SIqzh4M5SYXgc4ODxpGTdz/bW92tqPgR7pW27tYTI/6yHYHUY2UThTLIqRGG77aYPc2y
         BF88/jDAzRSVf7k7VufbVYDy6PhvOb+FhVclVx72BNxEZpaytHBmMuR8HxADErFsfSiN
         tfo6vO4skqZHCxrZ1pOFNNSbKw+6YvfbzJma0ejiDCNzAC+CgsJbIl9VgGnEQiVa0eJ4
         UMNQ==
X-Forwarded-Encrypted: i=1; AL+hErEQIFNO2PmLdZObTqOYFe3KvYMQSCjOXtFplTeRXxY2S/UuYJRAsQaCorpKvW1Qb3x7CB8w7sg2c+MZpg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8kjUUPGpmbX+02316cE2QHdZlTpO4mw9o6vPvnk8jns6mqGiGN
	i56Uf8agL0JWXTSIikQlovFPwOeO9NZrMep8U26Kwzp5b3h06vHQHrWgtGgcJUoGFFc=
X-Gm-Gg: AYBFou2l3P/tpvpQaqOkxOgs37k3O3mEvxlMIV+5ce4yP13fTnpYPFeffVbPa18a7Ts
	JHOKL/Ys4cmBpjKCTRQEFrTzsZv6KeDru/JCaQH6eNQ7tg8C5IQ8ZMSAH7RzNdEoPmOKO4IGteT
	At0V73PHiSP0WagToG8m2XM1Rhwamv3Pv9ZSi+Bqbuh546caiPjjmiw/CebLXBD35b/nsxfRtRe
	2hgfPT6cDTYUr6zF9PqXrw48ihtvkXS/570ffot7rskfXv2M0fUb4MdXH3fLUYBE7ZU74TL/Y15
	YgxJXHyQEONFP0DbALOkPG78S+TZxmMvQwM8lhjr7Mn2hmnaWSLsXyGP5lWFzu32SqtgfrnCy/O
	RnWJu5fiEFHqvaIY+ZroEv4HGQjh68O0A1Gr5nbkqP5h6iy4Wyu+ot9lWUWqOuueEa2G8MA+I2a
	LukJl4bLyHlbq/Tsr5UUJWLg3dfo3x0i8muot0sseE3DKYFiAbHOC1LiV3/+EMRGYn3XakAS9Jg
	/kfhWbSf7xtCX4S51auRObWAz+vaTz40AXnqJoAjJhXyWEJVxvkkwr8PV4M2H28PL6ugS80fjqj
	+1r2NuG6xJMvC5exNjeowdLbBuETbjBKSRz7vcGx/Cbi45Hd7wtCQQirn9OL+kgKCL6vGWC0b3I
	KuBvpk/s=
X-Received: by 2002:a17:907:3f91:b0:c42:102f:15d7 with SMTP id a640c23a62f3a-c5096398ac9mr127750066b.10.1794557800269;
        Fri, 13 Nov 2026 00:16:40 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b4214fsm65243866b.35.2026.11.13.00.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:16:39 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 09:16:37 +0100
Subject: [PATCH 3/4] arm64: dts: qcom: pm6150l: add LCDB regulators
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
Message-Id: <20261113-lcdb-enablement-v1-3-1dc40b49ed82@fairphone.com>
References: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
In-Reply-To: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Val Packett <val@packett.cool>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794557797; l=914;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=jSFr6IDnvz36B8/Z3/vtjUsuHYxlF+1hv1m2I+QA4eY=;
 b=gYNntGCDYW2h8z5NxO9fK4rn5jIALH26kXQ6PcSladSms/2hW6O+tYlHjv3FEYFwHg4rVJ11U
 4WJBHNDkSF5BVgI3WYlq5TENmYxC7hoKB97X5jRUuatY9UMUmgi+enl
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Describe the LCDB block providing the LCD bias rails. Leave empty
regulator nodes, forcing board files to provide correct voltage.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm6150l.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm6150l.dtsi b/arch/arm64/boot/dts/qcom/pm6150l.dtsi
index 334f976f1154..095b24a8a01b 100644
--- a/arch/arm64/boot/dts/qcom/pm6150l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm6150l.dtsi
@@ -135,5 +135,19 @@ pm6150l_wled: leds@d800 {
 
 			status = "disabled";
 		};
+
+		pm6150l_lcdb: regulator@ec00 {
+			compatible = "qcom,pm6150l-lcdb", "qcom,pm8150l-lcdb";
+			reg = <0xec00>;
+			interrupts = <0x5 0xec 0x1 IRQ_TYPE_EDGE_RISING>;
+
+			status = "disabled";
+
+			pm6150l_lcdb_ldo: ldo {
+			};
+
+			pm6150l_lcdb_ncp: ncp {
+			};
+		};
 	};
 };

-- 
2.56.1

