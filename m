Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C74F261B65
	for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 13:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759238837; cv=none; b=LBXlBK7fh6Z5qKtz6R8A8IckqSZpIrOyRBmozL00X8EYmY42idiOorlduriL+0goOMy5pWVNeVfyhADL3w0m1iZd4nmZS+l9wOD5tHlqOulZxukfePsgAk5Er618zLgZQVzjDpewZXKe0YjObDHIjmVlODi8WpUrPokKB+C0qbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759238837; c=relaxed/simple;
	bh=C2c+iYmbNgGTOO2nKF6xIbNLg4yN9mRhc5CtHzgpGc4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WdLv13GYJNQtndkHeqzNf+1d5eg8q507L7DDfjMNWEZH5OwcIf3164xHaJSJ2sFbRGyiIjI/L//ejCdTMdVCJXhAzsxQqc/sHd3M/UcPR6OTL7KnCVYzOFEx3BwbY8waPtc2ZE3eWOcceM7rYve1QvnCqSzGCZNugyCmUuO1UgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aaXmhwDa; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aaXmhwDa"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b3da3b34950so431887966b.3
        for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 06:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759238834; x=1759843634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pEYWNqVN+hXm3csWbV92tvh3D0m5lJ5Vd6pA/p8j2lM=;
        b=aaXmhwDafjIq8CmeSc2aZEr69FBaH8jalQuIio+zTpzuBMCFyrevY6oUJQ/6dygtTd
         riCuHIE1+Ryt082KbELkkeoO2Fi9ip+9g25nDnOp/v4xbCY4XC8Nus029t4m4/FE/9kq
         RjsyHbg1RFwNPbziPpvJYMlMe6o3RmK0o1q8q2bNKIVKTlNS6GsukMIj/NrQ/ELtyXPm
         28N3moCURJ0/UxOMLEEvzC3+wpKQtKugXkl6xhUmRsR3flUfibprAim+Rp5UqN7mxgvz
         6xvj9cjvOpTjXP67L6p3tTq9BQloBz0L0n5B4lgdU5wAx+iA2dPVcGXpUIgrM8GeBz/f
         4DjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759238834; x=1759843634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEYWNqVN+hXm3csWbV92tvh3D0m5lJ5Vd6pA/p8j2lM=;
        b=GywKx9ineFTp6yxMf/V1wtTgkRM/UCwGpX+9DJCJCxA6c2gGzq0PESBhNq0gVeAKxP
         TQGKdJ7Hg+iEgSr/ddMhAdu0s/N/UpwPRdJTTwlwT+ZDQbd6j3WruSv+m64P6vpEJbBc
         tJfb8c2q3Jyzgjv5zTKTMkGw/hRmwbwtiH9GEFRXYbFjRzR+n/7qPAzL41wY7rjRVXYc
         LiBUljOGVd4sJyT3q9smExiJJZDnG7WINpQEA7Z2hUnrqHSJ0zm+fO3RQW+Uz113eVOx
         d1yP8KZCoSrMYXKrHFS3NiQOwU6Uo7nG46IoepBueNBNZ0Hw1fjbwPrWQXjUeu4IbxBi
         qRSw==
X-Gm-Message-State: AOJu0Yw4Sw4ts9plBP7442g7BZU3qtnHJIU6XW2Wz7t8MLwi14D23QLm
	1HLY5rHCcfxRr7JNFGNIRBdr09rjpOZxgUB+09WNQyI3FI1p4lfLMLeV
X-Gm-Gg: ASbGnct+B0Gs3pi8otXdhuxbeLiMnccW6qAwBwAaPePxxmKoVznBTCb5p9K1ULRPxX8
	Q0aLHgpW998tjTT9kU7dJw01AJtpc0dFQmH8dKKkXXC939+RWIZ5s68C6CIqE06VhzSKA0/MVTp
	+lgzYFdFSMBUO6QVBORYgaSCpOiQxx2GVMVeL5Z9CzaLVzFlM1/wZJ8JzF42Jlxw1pD0zQm9oQ4
	8g31sgycqQT2jXruCKbkxkCF/r0Mnxn5l7vOsKR8HsMOLjqxVsCEgQNaO1nM5hHSLU5pmtpMnSW
	+g1udnCyIeZNtjKzVz0oZl7izFTBXzG98cWwxwpIR5rV21U7wRyj3EnrLHLZiNE4zqGyzb36Avt
	IrOUq+lUj65wdYmC9iLypiPhIV5+57QOQ3TZQ7YingqipnVUCkDKsKv0yqizuVWCtBw==
X-Google-Smtp-Source: AGHT+IEIubUseLSqrueCli47kNdptFpvg2o9b0qj23reXDH/dzzBpT/3wCPqEhs77WVKuNIkRCUy9A==
X-Received: by 2002:a17:907:728d:b0:b3b:d167:944a with SMTP id a640c23a62f3a-b3bd167d29dmr1320480866b.57.1759238833521;
        Tue, 30 Sep 2025 06:27:13 -0700 (PDT)
Received: from crusty-box ([88.223.153.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353efa46b2sm1143934766b.24.2025.09.30.06.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 06:27:13 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH 0/2] arm64: dts: qcom: msm8939-asus-z00t: add initial device tree
Date: Tue, 30 Sep 2025 16:20:08 +0300
Message-ID: <20250930132556.266434-1-xerikasxx@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This dts adds support for Asus ZenFone 2 Laser/Selfie (1080p) smartphone
released in 2015.

Add an initial device tree support for Z00T with support for:
- GPIO keys
- SDHCI (Internal and external storage)
- WCNSS (WiFi/BT)
- Sensors (accelerometer and magnetometer)
- Touchscreen
- Audio input and output
- Vibrator

Erikas Bitovtas (2):
  dt-bindings: arm: qcom: Add Asus ZenFone 2 Laser/Selfie
  arm64: dts: qcom: msm8939-asus-z00t: add initial device tree

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 255 ++++++++++++++++++
 3 files changed, 257 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts

-- 
2.51.0

