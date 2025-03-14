Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045091EA7CA
	for <phone-devel@vger.kernel.org>; Fri, 14 Mar 2025 09:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741943838; cv=none; b=ZZjj8MW7Iw6IVh0UMyOXAGhlEH8GnSJSITona8QuaM5lbUl3i0mc5LomBeK+dWZnkik08JSBWf9tANVlZwLhpWEtVkbu7XOcbjYvRGj62BVkPDOOOx4XmOdlc1G++Qn8b9jZ/3cKPMyqR3aGlEQ5SWZsPePUiCDVGIclNPzcOSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741943838; c=relaxed/simple;
	bh=5dhZAV9EyRZ2bVUtZeNoK2QiBwoclF/FSawk68+cTSY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qxkL4yv5jTsxBh65uTIuCVcioFrZdIwhIhfexAij6jLAOHa2bajGzruDBTn7a1Mgn0YCVPfZYSLSixFXKPDatNgrlikIs3jnMlpGaEDB7l2shbMo23K87KHe2GdPU+Yjwgfqnh2QVJmp2bS8nDvi5RarNaPM5PgFLnSeGdd8Dso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cRlSUo3E; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cRlSUo3E"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac289147833so330030166b.2
        for <phone-devel@vger.kernel.org>; Fri, 14 Mar 2025 02:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1741943833; x=1742548633; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1MO2zgb067YUwCn/NT4o8yXeBw8prnigLMVVoVIjxU=;
        b=cRlSUo3ExtvHvtfhqUJgS+uohe+8ubq9d39fIlVNIqE20RFGd6ncG1O+zqAyqNSdqV
         iXlHA91spkcDPUsWvzicqKI7FwZDyuoeUg0E/9WrGkeD3dPtvrRsfKGR2BHlpE2P6hoK
         nFKiO2jkGI5h+34I0sfJuPbtWyJDBIEfrE26MHVcv2ElNWy8X45BrCm4hEQxzepw1kWT
         B9oeEnht8xlBwpjCHHvnYCiryXUaScIEnsDS05bypFFqaXhZ3mGaOu/2fq3UsZfRc5PN
         8YdzOMfxD5kTIUITmecBIEOtu3DvmfSbIEUTK4ccH+3USDm/mNPguQtAweLsS3O1QxUa
         zkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741943833; x=1742548633;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q1MO2zgb067YUwCn/NT4o8yXeBw8prnigLMVVoVIjxU=;
        b=CF1K6PJzaApW1d1QtoBubYZa+3aYo7rTYnkK31Qei0633xpvqH/uuTzTji0fmGAkhA
         J7FYDfekAPJmVkvMEcGv/+bXwUtwHAj7oLTNHWQ6ciLE9XPrpcI/ydoZo37gLejNdE6U
         4LDJYX3oh0gmmJ6fNISEef+3FQpEEwoOYGcrfVTXhC5bzGxFHSs4OTTyc1IPhlNtIsAS
         q6M9/IHCyrbIVpKSoUk/KhxEPcIOHr0q+hmiA0s8o+8AS0dKtuqcYkmTJ9AdAsZoSLJ8
         j6c404MpMtvxQbloGRHypbgNhS5UKqDwgtIM3XxghoJi82JoR4o7N/jR6CkFQTZixZot
         Yjxg==
X-Forwarded-Encrypted: i=1; AJvYcCVU0a91beXGvnBgBrSIoKRFaUEvH77I8RLBTB2e/GhuW1xkN680K9lUFVde/Agg4+MaXB0AHDQyuxlWTA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7g2S1Ijh3Al2zd1YVQqDw9+bzMDKWmo72syPDln9m9XxnjyuP
	eZbMj6A8lkVmEt7cEnrs7PX+8hcWjUd+0DBGliVxK42OkhtGwmB6gKgz6/zHwm8HQ59y39im/qZ
	7
X-Gm-Gg: ASbGnct73hNsUNaEdZ/F+YM9Yhx9ijIEnLPxs8aHl0Ih0FdUu9EKHEukJSZwpzUCsIs
	50w9yfAe0DpGJrZJcOmo/u3YZoFyqRGWrcxA6EofD4NYst+LRoBgL+hfSRT6H+AR5reBkrw4vrt
	n7tVkn0O3gTmXBZBKc9kTM6YmegprJm+aHFUtRvN43O2UWZs8EPEhYRsNl5T+OFL0B6XQLjCF+D
	cfxaCtKE+wPIeNjWez1viCnB5ugDlopQ+oeSqYiLw67gmpuZZ5H5VrYm7wxgNRT9L/DL7W5Z83F
	0BUAdXsC7TpXvUvCdLyoCi2SQCmBxwKCCMptwDA1EYmM1NyAfly39mmmQvMC6ic/j7PMpoZ0anB
	HKF/yEoxALAbpqG9d8A==
X-Google-Smtp-Source: AGHT+IEsuY5B/NS2S21Sb19Nfa4GPRSr39x8zR8AnIVtNQ6bdJMlUrRQM/Etqzact+Gzgp81scA8Fw==
X-Received: by 2002:a17:907:2cc5:b0:ac1:e1d8:997c with SMTP id a640c23a62f3a-ac3302755d0mr184197166b.31.1741943833036;
        Fri, 14 Mar 2025 02:17:13 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aeadbsm195582166b.29.2025.03.14.02.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 02:17:12 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Fixes/improvements for SM6350 UFS
Date: Fri, 14 Mar 2025 10:17:01 +0100
Message-Id: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA3002cC/x3MMQqAMAxA0atIZgPVGkGvIg5SU81glUZFkN7d4
 viG/19QjsIKffFC5FtU9pBRlQW4dQoLo8zZUJuajK0a1K21ZPDyiucqYVEk62jmzrMjhtwdkb0
 8/3MYU/oAv4GiMWMAAAA=
X-Change-ID: 20250314-sm6350-ufs-things-53c5de9fec5e
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2

Fix the order of the freq-table-hz property, then convert to OPP tables
and add interconnect support for UFS for the SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      arm64: dts: qcom: sm6350: Fix wrong order of freq-table-hz for UFS
      arm64: dts: qcom: sm6350: Add OPP table support to UFSHC
      arm64: dts: qcom: sm6350: Add interconnect support to UFS

 arch/arm64/boot/dts/qcom/sm6350.dtsi | 49 ++++++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 10 deletions(-)
---
base-commit: eea255893718268e1ab852fb52f70c613d109b99
change-id: 20250314-sm6350-ufs-things-53c5de9fec5e

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

