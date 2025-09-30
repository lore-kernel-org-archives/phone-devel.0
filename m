Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA9C1FF7B3
	for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 14:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759242757; cv=none; b=o4iRayt+OrhYkc23Y47OPLD3RFfsmmhfQ+QuNwibrGGqLS3ryIWTwCqijG3zwhcI+abS6AUsgXXnLpYRwUHtjTcXm4OZl4Efl2KS462YC7dkoBNREdNU2eaFx18nqB7GURWjKoXz6WpF7sOr5aY0rEgRp9VxaosWFp5Dj41BpFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759242757; c=relaxed/simple;
	bh=trtFIVQ7skIm+AJ2uSYPYV1+QuWRN+OapOx2C9yTkv8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kYfP1LPpImtQp9G8RNxNG13NnBR/Ca2tAGDulzsoIGXw7guz4Pg4Eu4cMEkJkznoM/2m4IrN15nwiTvSMml8X5a9vog2O2HCnHHjf9XenOkj3VPOLndFBVal6K8JZ0OoHi2LiHE41UxC8fUNACdjwGhzZD/wiImPzcevinV6WTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=uo99jEBb; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uo99jEBb"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-63163a6556bso13006713a12.1
        for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 07:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759242753; x=1759847553; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1XGzvIYD2K0dKmTD5NLqz2HHH1fk0VmQ6ZCiFWN/CWQ=;
        b=uo99jEBb//E6n4KlO+0QKBYQJb6XRQl1vJxtpInYFxpMOYsa3pKkSd0e8ODPCrFxUK
         u4LIUE3V1hdZ1PZwH2cL0ArZnkF7BeSj7SJ6ewamd7HMsFI1fw2po+VACQJVKNYSz/lE
         LBPv7pWLdJ1/SCv+6MhCuPbXWNjoKsd6M4YUtTOnjR1xcNMABIb8c2eozGP7a06XuA7R
         S8R/vC7/rWCmEYBnpDwhTyT2e+b/VmpowgGVLWnsSghpmREeTPnva89w/bGAkuPXI1P6
         MjYHbb6T7ita6H7ydohm5Bhn0yJLbF0hAfoySuAjtzeNFNHI+x2pvuZ2kYxZsfI/AcN1
         10gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759242753; x=1759847553;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1XGzvIYD2K0dKmTD5NLqz2HHH1fk0VmQ6ZCiFWN/CWQ=;
        b=hBFVV3Y2DW1w6hj87VkDO9FZCE81g6NrX90dAxuO38TeQHxp40eOdIcxoTTPowajNL
         PHuiRiz7e/JpnapwLMvhrLiuObBNvQxzmV8KEvamYSNG0IRCVQKK12gPV/n7YNKU6zUp
         WNvJEt0GAYdXyz/JSA6H15RSwmxUplhuuLZgFzc1eVDM8xODvJnkvfOb5tu1nCZW2rjx
         S4YSaYzqG4tU5sdCa5ekwH3s0NpOhR/T7emYUSxwKEF082srk5Z8JmuoFL4UF1DrivwG
         PqmRHHsnJFDkiZS4tVOp8T+5EM8KUyfbaIdaql3gWPXdQV8IDi6HqyjkFMrWUJfBxJUJ
         AumQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8lxaXc3Etr4CCwwdJnvWepVA9rrE+JQXrAfcMzHmh+Gy0+36oDJX2KQOlDs6EgnirKcv/q7g+XJZ5nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJb2P8m9l+V7XvtDJz4Zh8HEd6XAdq9ZdbaN4NDmgamBpsPx95
	gD4PC5vzOQwpUqo6z0vMJktvgl+oZiQyehIjVwYaGxb1PQgsXyMeNibiFQl9+IUVwII=
X-Gm-Gg: ASbGncteL5N9VLxLONfauyxtXfsk/tG4szmMOPErM54geTHKytFJgLXyFdxGXBDobyj
	F8u5U5632gurSQJyZytg8uut5c+cfntGParI1dkaz+ZW5MKT7K8rxsDCZC2TsilEs8xXkfNmXed
	XILlpOXFXuObPR58wapgCBHaf4Sh1SIzKb4FVAezVUAkgc3/A3i5Xy2eeqEpy/j2Zsc/+AfVMd9
	G4+/m9Osks4u/AhUCNHXP7jspu8qZQjxw+KIhktuL0EiPwRmGY/u7aNC5YDdyTuOeIYqHbZgOmT
	dm6ICFVlR5OJguosHtG6AN+T/01Lb7TVOeRS5Gyjt5oo0hASm8a37rjmLc3oS78piMbslZx18pS
	zj47D9FovRAtfp3uRs1a50NgPa3EAP1maipMZiv4P8NRxXBj8UmEY9i/N1fhZK/7IsnsiCWbHqr
	JPmltaEkVZEqh3YlBXULKm7MJpHayB
X-Google-Smtp-Source: AGHT+IG8lOLegfuz9sdLqi92zTTH2vZJK6klR6+7kLs717bzPyf9qtgelOMxZ0NsFbtzUNaLIfkVwQ==
X-Received: by 2002:a17:907:d14:b0:b46:8bad:6960 with SMTP id a640c23a62f3a-b468bad6d6dmr66677666b.31.1759242753382;
        Tue, 30 Sep 2025 07:32:33 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3dc2cf61dbsm499858466b.29.2025.09.30.07.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 07:32:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/6] Further bringup of SHIFTphone 8
Date: Tue, 30 Sep 2025 16:32:18 +0200
Message-Id: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPLp22gC/x2MSQqAMAwAv1JythBX1K+IB5dUc6klbUUo/t3ia
 ZjDTAJPwuRhVAmEbvZ82SxloWA7F3uQ5j07VFi1ONSorxBItIkSzsxV2B7RaTNQ1+DWIPYEuXV
 Chp//O83v+wGrc7SkZwAAAA==
X-Change-ID: 20250930-otter-further-bringup-f9e640c4008e
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759242752; l=943;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=trtFIVQ7skIm+AJ2uSYPYV1+QuWRN+OapOx2C9yTkv8=;
 b=qsGVrAkXP50Vge9B0Ma8EEFSVt6ayyjWaeKJa9SCVhcPnmY/baNqhqIzUOMWmIbK4rz7P3d/T
 7qL/hYgE3JQBqzQ5/ScU7vwrY2Q6i2+N8g4TaFEEZH7Zg0usT7M/IJ+
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add some cleanups and fixes to shift-otter, and enable flash LED, RGB
LED and Venus.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Alexander Martinz (4):
      arm64: dts: qcom: qcm6490-shift-otter: Fix sorting and indentation
      arm64: dts: qcom: qcm6490-shift-otter: Remove thermal zone polling delays
      arm64: dts: qcom: qcm6490-shift-otter: Add missing reserved-memory
      arm64: dts: qcom: qcm6490-shift-otter: Enable venus node

Casey Connolly (1):
      arm64: dts: qcom: qcm6490-shift-otter: Enable flash LED

Luca Weiss (1):
      arm64: dts: qcom: qcm6490-shift-otter: Enable RGB LED

 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 75 ++++++++++++++++++++----
 1 file changed, 63 insertions(+), 12 deletions(-)
---
base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
change-id: 20250930-otter-further-bringup-f9e640c4008e

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

