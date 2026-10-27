Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089352;
	b=ZAuoiesNbb6a+GcSGEOSPVc+9btZm6M6A0nbu2HOpdoMtKVZkzBOdidvcuYUPAvZOmI+
	 WOAs+pTL5ZCHu7TmHnBArTDQuPemfygMAlD4d8zHurF1QpCNveBE793fGnHDcEqPX+A8Q
	 DcfuBYf34jQjKMEUmdL7tAMPmLySTcZA7XiU7ppyydG4tjg7VO8fP12YZprUe4uCAUt0V
	 ncS9aWP6ciI9DKbgPN0V5GU+OdcIrpKS2TKse4m7IAExNMVWBTH8uJt0dRgEifnLpmmZm
	 8J04NINte/Sgy39CvLhdiYQ5sWlOpQ3gVGbk6m8aza53LfIpeEs7DaMbdRvZobVC0wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+q+RfQ5Kwv1XNt4YuEC2Y4+X+a7USu5opNal/bTFsOw=;
	b=oBxegqcc3UN+y5ARpQUUI2KLZhZsg1MtaJhqfHyGGrCNSGegvkmO7e3FLRsEIVJI9yv+
	 PSqSqcS0EHivE/XNd2Bx+oJve3o8cAkPkmob83uFnFyQJa/hpZMxmTNBjqJUanMl6d2dC
	 PArYaaYeU8yoyeSqzpakEW6j9rjW1l/At/Ks0MaqfhXkTIQRj0EYMj1f48bFs4CCA6Yza
	 hAIp6+pYlTijYv7J1M2V1pnhm+g/691Rhfo+qiqRtd9sk9COzGdxoTWuKegUpIFlgmfj7
	 ft9hZbqff181K/Ci8IdOFDRb6ljZXULPF7kDr76iSEtT4Bl+kJ3tEEdAayXdF5GWDxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZurG5xut;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECC0606A325
	for <phone-devel@vger.kernel.org>; Tue, 27 Oct 2026 08:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ECC0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZurG5xut
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35d0be18c71so899865eec.1
        for <phone-devel@vger.kernel.org>; Tue, 27 Oct 2026 01:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793089351; x=1793694151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+q+RfQ5Kwv1XNt4YuEC2Y4+X+a7USu5opNal/bTFsOw=;
        b=ZurG5xutDCh1J7m4GPD1L2fxDLreUhtXfCdJ/Qc0XSYIV3caH9ozgfgRsilfd9MiwM
         WqfYgBCJvBtKJGTxAl+ukXEnDIM+oLtaQcxAsC3+fO720QsZGx8qlGNHlPALrypI92GJ
         LtRZdAaL2NHqNNLZRIM4TJESul12xrc0r1TIg5UH/gfHCaqnsimeF1+ZeIaQZscH/hl9
         0bZr2dpbaagVpp2X2K5xAjUFcHdgy1jIaXKXDDvk/xUQyKR/N/yB2GpO2IxGfpypJz8E
         RB5Jsf1R2fhyL25ZB+LyOMYJn2pUClZkIcopdr9zlORMqMXbPvV8h+V+1lVYpFSV72Gj
         Eerw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089351; x=1793694151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+q+RfQ5Kwv1XNt4YuEC2Y4+X+a7USu5opNal/bTFsOw=;
        b=Gvnc7Urg4G0ab/J/3ANI3taO0mqj2co7bYB99wcVYVAKhrQntDhVRx6FH7aqq9k7zm
         ZiMoj5TPCNAIRId5lVT699XwDqSd78RRYVAZWBEavuGg15h7O0Pt1LVspJ6L3QCJFz/d
         kbWmAHwZy+2FMRGIWkCA9zGI1Bprg6nVuoqGBrMMDBgZ9KuCL7kHg2CrVzmVcm/lO1E1
         rduxDkQzXJTFZuswleJP0KwHdDOp/qI/e36Xd+mk8St55ccXJVhR7HhJe2NuTEkMEVX3
         1Y7l/uRT2rK9cbd9G3KwkIG+hgLhEjpTERH9M7KKA7uPCqARPqInkzbHO00GTYIpFVFW
         kRVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkOz6iBzytksucvBqbf6311RJ1wUABL8pU07u2Ibyq+Y5dwq1kEiRP9Mv4g2MInFi+tEnPcA26aGMp1g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJHhCCcH0xcv+FHkJ593nfSF5BNyWVdWZnc/5iHp4zGNppBX5i0
	3NDvxFiEL0BbqmwESHEHcxe0Aeb4gUYD9vIS1ajCn3ke8vj0dfjHhbqx
X-Gm-Gg: AYBFou2j36sqaPm8E7Jd8UceHnv0pwUD2AH56id6bhw7WSQCnG7TxZ0dJQPHWHQZGeO
	KpEzKeaQrrYImk18YfIDpfAwpeBq4RlyBOH9r31ktnIcMgJxYkVxsYSLg6+le1/rl1MapfIGwQm
	lkoZitH4uMXM1Ju2ENylsz0vrzgmedX2LPpalKUSNm0zdWqWDEUfFJVBJZDbdKvQGyBpXZ6qmtn
	HGp8IZXKv9DouUkJY0hQyoiqHLJjCZyUl3+69wO4Pd9m/RcvVHsCba7G2SlE4+LxntSehnvMlub
	1hZLHOS9jfpxUas0klhJuFWvDGg+t+ktALZrM1ji9maNIOsKGM91/lEQZrm8ECuLYuMlSZlZmZV
	KgeZ7m+idbVI51TBysUk6tKDHR5PSKGRn0prcL/TMAP5nSTfqvAk752wGvqL8yUzytT32zohBRY
	lhVwim7gS3rKyuQ/W4ee0L0qQlfPBC2wzH4YhWMQa4PnBisZ8NcLyaqgtW/7tatsBgf2dGjcmKi
	0HQ44aT80hh4tZ7A4FNgAK8j7ReMdqSvg34xaGeG3/wS5NrfgwhyJUqbRC76wZoY0+fXC/qpZYf
	VXQul5H/WUEV2aUEIpNtTNS3LEH0AXSKLNyxUH6uPr7ECg==
X-Received: by 2002:a05:7022:1703:b0:144:f0c6:ddac with SMTP id a92af1059eb24-1a3c53db509mr2547824c88.17.1793089350969;
        Tue, 27 Oct 2026 01:22:30 -0700 (PDT)
Received: from localhost.localdomain ([113.161.48.203])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm37314409c88.11.2026.10.27.01.22.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 01:22:30 -0700 (PDT)
From: Adrian Nguyen <thenguyen1024@gmail.com>
To: Fabricio Akio <fabricioakio@gmail.com>
Cc: Casey Connolly <casey.connolly@linaro.org>,
	Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Robin Snyders <robin@snyders.xyz>,
	David Heidelberg <david@ixit.cz>,
	Richard Acayan <mailingradian@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] power: supply: qcom_smbx: report charger state changes
Date: Tue, 27 Oct 2026 15:22:15 +0700
Message-ID: <20261027082215.70983-1-thenguyen1024@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003-qcom-smbx-chg-state-change-v1-0-fffaef446932@gmail.com>
References: <20261003-qcom-smbx-chg-state-change-v1-0-fffaef446932@gmail.com>
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

On Sat, 03 Oct 2026 16:45:20 -0300, Fabricio Akio wrote:
> qcom_smbx does not handle the charger's chg-state-change interrupt, so
> a charge completing is not notified and consumers can keep a stale
> status.

Tested on a Vsmart Active 1 (SDM660/PM660). Switching charge_behaviour
between inhibit-charge and auto now fires chg-state-change once per
switch, with a uevent carrying the new status. A charge_behaviour write
alone doesn't send one, so this is what lets userspace notice.

Tested-by: Adrian Nguyen <thenguyen1024@gmail.com> # Vsmart Active 1 (PM660)

(Test script and mail drafted with an LLM assistant.)
