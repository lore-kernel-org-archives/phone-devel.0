Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9973DCDA4
	for <phone-devel@vger.kernel.org>; Fri, 10 Jul 2026 09:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783675378; cv=none; b=hlVPFDEvoxtHGGpFgdj8LUcW9WEqYMGTHGXKkmsOZeQUX6o02hYZqFv2GwkHtSQNL/h64zqwcvNzJImelzEXaRDHN+D0Vg0EFmmLCeOtszxhN3xDD22p7C2Nu1OoyPoODqgCXnlIB/46akSCSXagm70nKx+1yx9o6haPq99WaEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783675378; c=relaxed/simple;
	bh=zw1mFAgdyKfwxUO/njqEe7kg2B2BmHFMBO5LtyuiIrY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FapA6KqpVXC8AUu571dcCeS2vWWhKRqFs3YdQMaBhRtrqZfMleoiu9gMHZWLnKLgKah9V6byn8aaap3b5+zOq8CVH/eLSMNlL676QxBA47sRgV7XlXlHaM7VFmmML2fNt6Tu8XhHkLdXpYTGege4dCAL2p8tst7MzPJqZmPn8C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=dWRL7MCO; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="dWRL7MCO"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15f020a223so102574966b.1
        for <phone-devel@vger.kernel.org>; Fri, 10 Jul 2026 02:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783675374; x=1784280174; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=43ADvkMGQUmy+J3D9zAwHZqQPNIWMHkG2zAIy0Ld1CM=;
        b=dWRL7MCOYZB5Zmb16RQaPELkA38J21mz5H/DwqZEIvbEJtE9FAiBupYmcCLA1zz412
         MJCNRiMfy/5hy9m9UK8FMZ99TaEfbbXx7F79YOuiNWxnDTukAO9Nb6mqYMbEi6g0PQu9
         eA+ph31N5ArQVgVmZQdLzd25gy+SaBTzVcA5R1gh5sd/zQhTuv4LQ0cSyZ7826U6kki/
         wzSV/nZK9drk7C7Q/eYVP1T6gXLkcE4FjqIStDFRsCwKx9XwgcZA/Pu9wHLor3/Hd8Uf
         oncY/NkPbM/J63TUHC4IwuQIjrG4CJw2qBu/7A8SE605T8bkie80BsVPddkADgbWAC7+
         3HFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783675374; x=1784280174;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=43ADvkMGQUmy+J3D9zAwHZqQPNIWMHkG2zAIy0Ld1CM=;
        b=IV8Ee6vsi/v5duEpYf1Padwhmp8SkcB/mASah7PLD3HLSm/zH5k4lqqdXAifnK4Cdx
         LrZ+TELHg98enMtetysYo6fVbNvjTMSYJF7jFGseCWrx/MgatdZCPoFoqQIwwpr6HmjQ
         VzS/uZ+aBRSsuKVRcqJOa2H8f3EfaOkBGxmNOIlaI3I0Cf2xxNBwQPRe69tJAfCu57ly
         OKvxX4e/WfFEaLtecFl+6Gq0YHQoPygf3bL1sH49kyPV9i41jJiDiGgwY79zzr2C7ON+
         fxrQmGJL630eFxDLNj6Kon8+gJZIrA4e0g2oEeSP83NtcvjIPSHkDrLxLlprjBIXaBHT
         LmLw==
X-Forwarded-Encrypted: i=1; AHgh+RpUdyP3bkhmlouU+ayIcCQncRZeKDapXydOIS0WvgGUrKI51Qaf8ksyeX7gm+7ZWRrTM5ZP0HcJ4Y8rHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsDMBVBsFmWMZUUMKxCDUd9qU3iu/B99AZcKGd+cXZwAvExZLK
	HOoMri8PD8/cbPXBH0ZVXpens6jR1jj/ttLtd3Ua3WHybMPa5O4gE8g8LjZxx9TOtDE=
X-Gm-Gg: AfdE7ckfxISYfJrAulIxWQipClG8jsSM2+J9ozhPN+z/0yF7PPv/ScCtx8q0zgM959L
	R4HahpKHAP1TC3j8HI6Ct0jVC1LkKqPOLYCClsrMcZ/ADKIy0pe+CPDLCSVbxMI0XXkpphlMVeM
	++vnEQ4LNZarOi8f/H4/lXw+cnAdsFM5mTvDu1pPiDE28QIgvUDLpo56nj3YVu9k31MMFAszDA/
	SgwduSJxy050z2jmA3vCVb8HD9nnwp9IYwDzNCm4iZ4ye7K1ANx5fD+f/llmAT6OyvDx2nQNs/2
	657tU3JVtgHMsxmSlCwPTl6WOz85x+ALkbRCWnJC1ivUyJz6iJ7tyb+1o88sBnKVKN73ay5GxDO
	Bzo4wLeCEQLZ1baiawpAEb59HKJuVQSFWu8SRIJkURRPtsQisXF/aKenQnvaR3WqPFcYIROjQDg
	Hw93rWEB2vW5mYXbI74XgTgJtbdhDJt4/E1+4SuD4LIWPEuqSH0QCfyTpL5AP/KyO/W88=
X-Received: by 2002:a17:906:6a1a:b0:c15:db3a:c105 with SMTP id a640c23a62f3a-c15db3ac262mr328581466b.1.1783675373799;
        Fri, 10 Jul 2026 02:22:53 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm261785566b.36.2026.07.10.02.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:22:53 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Add Milos CPU OPP table for DDR & L3 bandwidth scaling
Date: Fri, 10 Jul 2026 11:22:38 +0200
Message-Id: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB2IKUyhVxEXJh3bKdWEjBFBv
 LtRl2/x/wbKSVjhVW2QeBGVMBU0dQX+208fRnkXgzWWzLMxOMo/KPqYMcSIlgZH/kGOyUBpYuJ
 B1uvXdrc1ux/7+ZzAvh9nUbzNcQAAAA==
X-Change-ID: 20260710-milos-cpu-opp-26fb6c36be60
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783675372; l=1427;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=zw1mFAgdyKfwxUO/njqEe7kg2B2BmHFMBO5LtyuiIrY=;
 b=2ygJEg8asxfZxnC971eSgSt5Ie8THGBJkGRgEb0Dqld8rZ0/r6+OqBE/HUvUiWUiS4STcBzMq
 yUyWpfLcMpSBX9sMHCDh3TL+w0L2fWGSgd+5BIlwI5sQ1bc7ExtvxRI
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the OSM L3 on the Milos SoC and define the CPU OPP tables
to scale DDR & L3 bandwidths when CPU cores change frequency.

Tested with 7zip benchmark ("7z b") and membw [0] showing very close
results compared to disabling .sync_state and thus keeping all
interconnect bandwidths on maximum vote.

[0] https://github.com/doug65536/membw

Unfortunately there's no support upstream yet to have different
opp-peak-kBps values depending on whether the device is running on DDR4
or DDR5 RAM, which is where Milos should use different DDR votes. For
now the DDR5 values are used which are (usually) higher, but should
hopefully not cause any issues on devices with DDR4. TODO comments are
placed where they differ.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      dt-bindings: interconnect: OSM L3: Document Milos OSM L3 compatible
      arm64: dts: qcom: milos: add OSM L3 node
      arm64: dts: qcom: milos: add CPU interconnect properties
      arm64: dts: qcom: milos: add CPU OPP table with DDR & L3 bandwidths

 .../bindings/interconnect/qcom,osm-l3.yaml         |   1 +
 arch/arm64/boot/dts/qcom/milos.dtsi                | 344 +++++++++++++++++++++
 2 files changed, 345 insertions(+)
---
base-commit: 1db6c7d7df786928c6fb52625f46f1f856158728
change-id: 20260710-milos-cpu-opp-26fb6c36be60

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

