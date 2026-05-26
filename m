Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E971B3128BE
	for <phone-devel@vger.kernel.org>; Tue, 26 May 2026 15:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809404; cv=none; b=Wvh1J+BL9tc1BTALU2pwF9jh+yEIur16m6OLCoCnGzYZi4FwTUETuZHhJ8OSQ5KYAFLeFwwJjsWN0+gotUYtnlAqYZMlKFq8ZjkNrfXcKh7/GNrov2w7buW1R4edr3YvAo9BpjpCuoxGUYysT6i6kCXvpbckdWrp4PPVoqyss3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809404; c=relaxed/simple;
	bh=gtARaji0iedyihFboa4MiYFPXacfVkUajiysfN3oeaE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U8fbEf9704cNClEE5ZdE60sA7cq2genc0owDBoKuD4D2KwZicISLTdGLsIsYCc6ZS/gs2Ie7UBp/0/5NXdU9YiWZZtJRd92vch9hsm0IqmOV7hVczNK4N64vSJbHMK+o9fO50wj+E+FjNXNplKylwLOyaoqpqQV8EHjTuzHAIv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tqufA+hu; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tqufA+hu"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso91849115e9.0
        for <phone-devel@vger.kernel.org>; Tue, 26 May 2026 08:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1779809400; x=1780414200; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1nEjxAN1sA7rfDN69w2hPO+PESN8+FOGSXAcryFYRJQ=;
        b=tqufA+hu7Jjx0aUFggOOVXILhIkGTmXFa4yMHxgyrvSua8x7kakM4oB0XE8XLbsdjT
         ApZode0YGocW6+vUmyhHXrXGR6jD0jRCyl1GRaKDMkgP48R2nAjb7QmQ9LUSevpm5Ysl
         cUmU0VAwqrqE+dLYAtDxMEl5XuYc5oqZuGjuNIlK9AWngGFtgX7N3Xgvx7a30V/aJaC1
         /HqY0LYhRXwQefKefYqvPbvhSb4J3xruz0UyTBi5bX3rnCtzr7NH5phuwV5KXU4wrO2E
         Fimly5dkHd5MWEUOrxUa878M9R/8MDCBJDceL7Sp7hfDzJvbUc7B6KCyTv9gwA+Mda63
         lUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779809400; x=1780414200;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nEjxAN1sA7rfDN69w2hPO+PESN8+FOGSXAcryFYRJQ=;
        b=QbjBRYUKzZjJ9t9+CimcnHH/NLAthLmrJ/Sc1WHPUWEk96WjPzv/Ep9ZbDmI1VWT4A
         TllFhaF7zvQjWLmV3aArzwZxssuMmoTw94+Swpo4TOFSrfHgBx+JmtzR2a6al6GEFHkv
         m8voc2j0dm5YZZMpa/fpMuHhMaumnTMUi9T2G65PPa5/z+U3oAL3P3UGl9hKjX798H03
         NcJvjtk4LNU5HOemGFb5pazk1WYLbJQCxXIR1PVN6+OOdVt3kchmLyjrt/QY6Bey5We6
         2vfMhUQvwSCDX7WzcWyjWFLX4DM1qClvW7e7mkBqJAoB7VMOSWEDcszilhvu9HDKIQ8q
         MdyA==
X-Forwarded-Encrypted: i=1; AFNElJ/z8cMxPQRnxY9pZOv1aOD3eORVXUNFeUJkXTpi6lqRAUw2Q2eoUv7uR0AelooTAIAqOQqr0gbx43LTxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YylARCb0pxWzE5pOdIlka3i3efgii8m1Fkv8jy5Qtety7S8choA
	/MexQdmFKjaNx0qvNSThLrw9xWa8G5JdM/QWPcqSARZFdKWl+b7QXhM4q5lpHhpWQW8=
X-Gm-Gg: Acq92OFVLuI9/F3+F+uW2gotDPcVb0UWv+bGwsrBXzmza04xsXviLe+awO4EPfJY4e6
	5Q+9sFxtj5vcVLj2wRNfOyDPMDaEWbwQsoD+TUOBNvsxZJUg6cDemdGIKJS8mRpDcJD5TcEqbPx
	garQAoxKf5pMzuJ6wLqeetyuLzybYPmGMjShvYqhksapio2As3wnYWXiako1zcR3NLDOYtcsfrP
	yMQ5qTG0c7EjwCs1wvXo79d6Ms3zpuF+ce7CzsN5RYfNJuZgHvO1uaE6BJFDYRaU7Sr/tFGNvrW
	RuAqp+NBw1n2jSuA3RU5azRLkLgnaPJqhkhY5D4hJDqfOrZUPwbu+jz8xTZ2AykJm1QGiM6+944
	EKbYYPsIPQTGhkbRXYEhuMFqzejBOzuIfRBmlv0hHRQ1WMjtLq5LjeWaL5cFYH/MDagpIqyRDSo
	1wbIXO1b/ghKT7xklMZ3Hmhb15yklKp8vFUa0P98rES9c=
X-Received: by 2002:a05:600c:4ecc:b0:48a:557e:6b4f with SMTP id 5b1f17b1804b1-490426d2805mr289300505e9.23.1779809400016;
        Tue, 26 May 2026 08:30:00 -0700 (PDT)
Received: from [10.107.1.102] ([212.133.41.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5caeesm37691140f8f.29.2026.05.26.08.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 08:29:59 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH RFC 0/2] Correctly use TX macro v9.4 for SC7280 / Kodiak
Date: Tue, 26 May 2026 17:29:53 +0200
Message-Id: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyMz3eJkcyMLA92SCt3cxOSifF1DQ3PLFHMLs8Q0wzQloK6CotS0zAq
 widFKQW7OSrEQweLSpKzU5BKQWUq1tQBjjlraeAAAAA==
X-Change-ID: 20260526-sc7280-tx-macro-1179d786af1f
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779809398; l=2723;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=gtARaji0iedyihFboa4MiYFPXacfVkUajiysfN3oeaE=;
 b=DU6lEr7HK0FtWOqwqRd+8LMDKONgKKPlX25JlgyaJSwT3dFB77t/ULxjshQKkiEu45KTBKZwn
 vUbIT0oHUXZDoL2/SiTL8lKQUWfJWAZDbv6gsdf3/VihGLLtWnKEmJG
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

With the v9 data, that sc7280 is mistakenly using, the controls will
have completely wrong names and using wrong code paths that do not apply
to TX macro v9.4.

This is an RFC to get some feedback how to continue.

1. We update the "qcom,sc7280-lpass-tx-macro" compatible to 9.4, break
   unchanged dtbs (the sources are updated in this series) and break UCM
   until it's updated.

2. We add a new compatible "qcom,sc7280-lpass-tx-macro-fixed" - name is
   just a suggestion ;) - and make sure existing boards with audio keep
   using the old "broken" compatible. This should be completely
   backwards compatible, since we keep the existing compatible working
   as-is.

3. We add some dt flag "qcom,use-correct-tx-macro-version;" and handle
   the rest similar to option 2, by opting in boards to the updated
   behavior.

4. We keep everything the same. We know it's wrong, both the
   audio-routing in dtb and the controls in UCM have incorrect names,
   but it's working apparently.

Please let me know your thoughts.

As a bit of a note where I'm coming from, I'm working on microphone
bringup for qcm6490-fairphone-fp5 where so far we've been using
qcom,sm8450-lpass-tx-macro to get the correct control names. I've tried
reverting to sc7280-lpass-tx-macro, updating audio-routing in dts and
UCM to the v9.0 names and it does seem that microphone (AMIC1) is
working with that, but I'm not particularly happy about leaving the
wrong control names everywhere, so I'm happy to try and untangle this
situation.

I'm also not sure where this v9.x actually comes from, maybe I'm lacking
some documentation, downstream kernel only refers to Bolero v1.x and
v2.x so these seems to be a completely different versioning system.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      ASoC: codecs: lpass-tx-macro: Use correct config for sc7280
      arm64: dts: qcom: kodiak: Fix up LPASS TX macro v9.4 control names

 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |  2 +-
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |  2 +-
 arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts         | 22 +++++++++++-----------
 .../dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi   | 22 +++++++++++-----------
 .../dts/qcom/sc7280-herobrine-villager-r1.dtsi     | 22 +++++++++++-----------
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           | 22 +++++++++++-----------
 sound/soc/codecs/lpass-tx-macro.c                  |  9 ++-------
 7 files changed, 48 insertions(+), 53 deletions(-)
---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260526-sc7280-tx-macro-1179d786af1f

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

