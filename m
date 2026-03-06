Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176513ACA6C
	for <phone-devel@vger.kernel.org>; Fri,  6 Mar 2026 14:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772806950; cv=none; b=QoLuuDPrh5p8SOPeVk0CTQl3mSf437m9XyUvbFbMdpcd9ttc/Zp+NxfG5NPn8JJZFeYZTv+5xVGU36BvBwut99Z3nkshP1JBv+9/3JHFMXqqLOh9aCLP97GvcXQ4Wqhltp9cYa54lhivWn2Oxfzn1Q73ZtVtH14ibAdPaqyyKx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772806950; c=relaxed/simple;
	bh=OussAjG8fbFFqG3utkJvBKqk21rJMwTmbRmYRXniP1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t/xnjzs624wMZOxkCgt5oAisJkq4TpIu1CS9h4w8w7yv9f+BObLe9vgdXDNYaYTlJygBs1QBbpC9HbiXwF8vb5k3h2yoLZPKTzTMDjgQkLA//kJG2G/VvToTTZY0uEtXRv5nT3Ty9mS1wLkhRhcOAJxRg+WfBS/ubO5YU6Uh3ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=02JLylCX; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="02JLylCX"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-660b497adaaso6402734a12.3
        for <phone-devel@vger.kernel.org>; Fri, 06 Mar 2026 06:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772806943; x=1773411743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/bRAg5T4pZtJKLQH2FWdjBQ+C0/ZtIItkMAKUEibNgc=;
        b=02JLylCXu3ArYlon0fZFqKnzhA8TfA8YEqxWSFFYqybwP9nKr8t1TqLNqUCzblDMjW
         SzkgU52tHjs1nw+qIiFmh5eY1vJWFDxVj5qfEf2AFPQOS9pXrB1UY0S0+pDxbttCESAE
         TqBUaTW+ZqA89DgHJ+HRnDWHMA/reOOMc/UsrjEaHJAqNnfiD9szfT7STnVRBFaj9DgE
         KZuJ4L7n7fGtqVOpxhsb8VQoXqGgZ7zCSXL0APZOjAIZPBs/mwKa456d32hlOFJLO6B5
         hlYkPvcWesPN8cb9MBushKg6InDyIGSbRdqkhaExIFSVSI9iyggU9tMTvrZrZmkLaAkp
         s1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772806943; x=1773411743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/bRAg5T4pZtJKLQH2FWdjBQ+C0/ZtIItkMAKUEibNgc=;
        b=PX10lNl4pSV8h2WwkO2QJ7QFBM/giax5OOWeBQ9aBbMcmsFQXSzRR0VwWUQNT3gfaR
         HIrSVO7oKwQ9MzPJvr8DmBn95cqbEZL8FcNwScSjwS4xcQSlU9N53ejMg/vIr2GS8rPj
         uj5kMGokb21i0Oj4/nS9QZ/miM+9G/nXe+AnzfyNrE6mqsAaaNAwAmeFL66R/b/Sqr2L
         wXpjLv0FMVCRa5IPhivzFbiOlGnJot4yKpU4Iie7Z9682AAgbpsHYZMPqPaAc3JhT1Am
         YUNGHocbiI2gYidMZ4abMuhjJJKu9jWP0V4WcWVW/SY5S4JCouphqEksMYlCr/z/xQry
         IdiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2vXe4pHVbl1B2KnbheO7DuxvD1b5wb4uPXpvbSOQuYSvBpET0JMTZpFrJfqrb59Z5sh+xIAaK0C0BDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YytL5FKBLoS282WTQPtBs96ZstZwXbpq95lqtF1BL6olciv3WvW
	F7S/mDwnYiejK6UrK2JoOSnLFuXT+5bMUyMxn0bkLJq8LhF/nWlWl2dHVzuM/wqO4v9TxDMHjBE
	vi09C
X-Gm-Gg: ATEYQzymxHSShrFbbiJopBgD+l18BJ7oirZ30MRuA0f5IL4FZO+LXXJMP3SpapIMRyY
	wlSxDQ62WrOYIJCREWh5HgeShcUGundLdeuDPGLMRp9tmNUTOGK2x2FARclhDcdUdymqMe0oXYm
	Bhpjg0/QYIcYqE76KK4JHfq9lmwG8FzU/GimAvPXPt96nYLhDzYyoP7402ddBGOzYwG/fo8jsC8
	RaRYAjQdz4wsEdQNQzAT9TBHkrFqSpyTRrqzor6fw58wgOyvP45cmkb1Z2XXmNs+ojM7YGLHtVm
	Q1Ml21xkvCNOPSv25pTFug/eWUfnIbBPLyNdnAuZMoScLIBGsvDjFezbbGFa0oIaJ64D4Q3SYwy
	r46p+v+UNkLgB6ZgKkm4c5pdjlW7hpwAsw2KOiBgYEhkm3Vbtw+t8leQvowS/ZpJlxfEA7Tbb4C
	O+7B4Yj0c3giqHy5KoZiuSf7LjvynvfqG8TGQx2xXsYhU/59+tlrd+0LhX5qnYhGoR4gtEuNnwi
	zEenPJoQzz1Vmg=
X-Received: by 2002:a05:6402:f2a:b0:65c:6d0:d9f6 with SMTP id 4fb4d7f45d1cf-6619d45a976mr1033867a12.6.1772806942847;
        Fri, 06 Mar 2026 06:22:22 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3c66d3fsm517251a12.2.2026.03.06.06.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:22:22 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 06 Mar 2026 15:22:17 +0100
Subject: [PATCH 3/4] arm64: defconfig: Enable Milos LPASS LPI pinctrl
 driver
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-milos-pinctrl-lpi-v1-3-086946dbb855@fairphone.com>
References: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
In-Reply-To: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772806937; l=715;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=OussAjG8fbFFqG3utkJvBKqk21rJMwTmbRmYRXniP1k=;
 b=OFivjjV4WyuTlJLQsk+h3UHX/H/piTEXQ86vP+pJ95fnEmqvIn1T4M7vpJDGZwBZDa3wHTkoY
 SJIFOZx3T5nDalppNNIRJmjHe6WL4qFhs6xu/xFRPrCb7jXsMlu9YsH
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Build the LPASS LPI pinctrl driver as module, as required by devices
using the Qualcomm Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4ed70ab7ee85..c8e294fa4b53 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -693,6 +693,7 @@ CONFIG_PINCTRL_SM8750=y
 CONFIG_PINCTRL_X1E80100=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_LPASS_LPI=m
+CONFIG_PINCTRL_MILOS_LPASS_LPI=m
 CONFIG_PINCTRL_SC7280_LPASS_LPI=m
 CONFIG_PINCTRL_SM6115_LPASS_LPI=m
 CONFIG_PINCTRL_SM8250_LPASS_LPI=m

-- 
2.53.0

