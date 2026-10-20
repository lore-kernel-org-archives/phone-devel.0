Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792525829;
	b=kYud027ty63vvbjx9GocOO6uSBLD5Fu+uJyWLz3KCS4iNHdBU4jjEsGVdNF5d6ljBh7E
	 ffvQYbVUxAwpPanf42i53ywCw+y40jCrI1gTGMqdOx9BfiEQ/68L+mzKiv2Nn3aMuqUYT
	 F7eapuJTiTsKIuh4a//xgdmS58pIp9Cypl081uhSOMiOhz4wGfoMXmeYHJfHjXT6/ueyd
	 cj+7PNU/A15doRmWqco03hyDeCuDBUZ2lDcTpqgiz5/ebBCkYD8tTLwuIgzNnUIHnk0Te
	 2ejO4Gcz83AlsMjBKcfN9R8QRRnz6pn/LIowywv3KgN9tb1Vrb4Db7aiuLDuvyarLbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792525829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hPa4PG254yePdehpmJWqML5hqKXw+sws5WB7y+lwM98=;
	b=jGOmQZAtC3+Dfd5BM5pJy8G2sreqEBG2wcLm8s8IcdQW3fMjskwrnIvq0JizSnY8b3CR
	 CBDbLeI1wnKb9zx0BB9qOEK6sfniEIsUAAH+yn2lrBMWm+fiZD1nxEhz/SBQ2j+IZx0SY
	 HD/32uAKv+4LUN3UVZObft43T0ZRh39kQUc8YJMO8jCs2kH2d8wRzbXRTiMzYXiX/aDcP
	 T1hr7ZgclFDbmxo5tgqYrHJ19tXyFyRFut2vKNmanaWUt6ntg2LQivlLNaAv1mtIAMzvX
	 Seyoksy67NCLb4QAkBzOofMTH0AThpKziMEpcPbULkTlAEaRC09mZY6J5NIcPzKKY+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NuIBbCyO;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E26606A31A
	for <phone-devel@vger.kernel.org>; Tue, 20 Oct 2026 19:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8E26606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NuIBbCyO
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ba3fba0080so2592261e87.1
        for <phone-devel@vger.kernel.org>; Tue, 20 Oct 2026 12:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792525827; x=1793130627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hPa4PG254yePdehpmJWqML5hqKXw+sws5WB7y+lwM98=;
        b=NuIBbCyOHLjMgBRgN0U2pccaR1TZLAsQhr1eI7b9dpYjk5TlNnN94DdOAXN19YkR7D
         FAf8nTaWqBcQbkylIxVI5KyXHkXknkDYt7DbtIn1A08do1AD1oVysJRCpy81PHz37BEm
         x014kEN3iJ04lFyi8hElEoVGeEPXX/8cBi5LcFdm5PQXylCE54Y2pr0yKGA4R6VQAHdi
         /HLYIHUAF/4tIGEKKW05bLQEnDiGo1snPRRas0w4qeATPZuUYn9RTZssEOckbbc6bnQ0
         pDMMs1XJUDvJJslhQxV2fG2OAscyUOSOnaNVGwJjLjWHyWx9fVUSKYloowuqwMfn+P9z
         ydRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792525827; x=1793130627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hPa4PG254yePdehpmJWqML5hqKXw+sws5WB7y+lwM98=;
        b=YNxiZn3Zjs7qFI5XiWGItlmHdr0CNJ/JcbMbIQmR6kTPR9wESOJ4q6OkaTxQowrmjA
         V6mVcMOUiL+rDR6ui91+PsRSO5M9XPjQ8dUwYCbhYwcTy4BEC9MbSuY6+TbqtLEuKGJh
         XlLxUjIXPpn1/L/x/18wBPLBI6FiJh7vAFlOiz+oQDDNST+JjxDxAQJckqAqoMQ6WFmH
         jbCJVHexgE+VPup397xhD0Ph57gjUjC5zGtzVTdm4hZg+5fc9A19oQrHcHL0tvzbPwPa
         nMe0/aUV8wu4ZZLxYR5Bp+JyLU2HuoBJUlIVuTRf46AKgvfdGTEH8NAbs22yuy2JCSKA
         6nHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxH7azviCPNQI+7048XD6sdlao56O+rV2XrCIz+wAzft4GX49vQCUH7I1tfliMWVBbQ0Z1NTzqB5MAmA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLd7lAL0vUxMqk+mkBawlxFu9M8x7G4EA7ONd+mWucM5WWS0khm
	oEjUROVonAYIGWkZKncrV137yYSB61TPG/JS6QkoLuG89fhGt0GWLdkG
X-Gm-Gg: AYBFou13eLCg0snBBFE15n0FS2/lmglZUfIMGU63j/QZv6sD5J9B2UDGgF/P7Qxx2Fs
	4qvfVaVZH+MEcOWsnBdt/Dq+8Z18x4cAU9f8quWThAnMysbrSgbPNVyT1ya7vwESfXVipp3ybou
	CFuLVz0Fe8G4S4S/O6cB6r9OJGNfIVJCoO0rbneJIe5LvhpgLIbMR1WqBVYv+T0Z5m1pH8xspXF
	LhsHmv4LX91t4bUlM8yHgswek3BCMNVUQGxvEbKvNV3Ph41Y9lwJc3DLNkXUwuO3qqxXgFQKkQt
	cMfi9QdEAqlDLnka1Xpia6ZrmJglt26YxSJXPwaasVJNiDaq0OIsY6CW23vIj+EM9aoQpa+vCH4
	OSgw0FT8dE+oJEK+rLuQSwI6/mqC8gNLGLgM8oZfdFwvusK/OpsWshVzeXINO7LAUP/R4i9SasL
	68zKoMleIeJ8NoNyslYT3OpYrPBuBqeKFPmlyqOXWfEdxlXfw/pgV5MKNwOImjQvJEL90YcEkTa
	rd5SVB1L+NvT+EKTFNZGCY8qsesl/lwKUA+rEeaZR5b1S/awilwZCm4egfHbHJeiSm4zOtxSZ5N
	n9VHc3yrAG4IjVaNb1jkWsAym5cHFpd4or6ouTMO1iq8YjQJRKjJ8gzvJodqC3efqQaO0dmNcQJ
	kLA==
X-Received: by 2002:a05:6512:3a8a:b0:5b8:bc5e:b57f with SMTP id 2adb3069b0e04-5bfa1c1fb76mr4379e87.55.1792525826617;
        Tue, 20 Oct 2026 12:50:26 -0700 (PDT)
Received: from kompukter-Systems ([83.142.235.16])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa11a8caesm75345e87.5.2026.10.20.12.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:50:26 -0700 (PDT)
From: Andrey Derkach <gabin278@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Kalle Valo <kvalo@qca.qualcomm.com>,
	Michal Kazior <michal.kazior@tieto.com>,
	Richard Acayan <mailingradian@gmail.com>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v4] wifi: ath10k: make in-order rx amsdu buffers persistent
Date: Tue, 20 Oct 2026 22:50:20 +0300
Message-ID: <20261020195021.1133728-1-gabin278@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020-ath10k-a-msdu-v4-1-670b69d39059@ixit.cz>
References: <20261020-ath10k-a-msdu-v4-1-670b69d39059@ixit.cz>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 20 Oct 2026 20:52:07 +0200, David Heidelberg wrote:
> The WCN3990 firmware may split an A-MSDU across multiple HTT "in-order"
> indications. Mainline drops these ("failed to extract amsdu: -11",
> rx_confused, recovery), collapsing throughput under load on affected
> devices. Stash the MSDUs of an incomplete MPDU in the driver state so
> it can be completed by the next indication instead of being dropped.

Tested on a Lenovo S5 Pro (SDM636) with a 7.2.3-based tree, on top of
"wifi: ath10k: trigger hardware recovery upon rx failures", replacing
the older out-of-tree version of this patch we carried before.

During TCP downloads the firmware split an A-MSDU across two in-order
indications (once in about 39,000 indications so far, counted with
kprobes on the stash and resume paths). The patch stashed the MSDUs and
the next indication completed the MPDU, with no warning and no
recovery. Throughput is the same as with the old version, about
60 Mbit/s here.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.1.0.1.c2-00455-QCAHLSWMTPLZ-1

Tested-by: Andrey Derkach <gabin278@gmail.com>
