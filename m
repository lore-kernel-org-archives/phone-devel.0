Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954B03DF014
	for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 16:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774025153; cv=none; b=RokEld+j5hd8BpDHEToRrRBDlhOPIRNLU2LZHP8oPkQh8cDmB3aEiD1Br++FoXJmO0UJVyVu/akRIwZ5nn3rBu61hAPyhhnIHW0jTiZHQPWhxdh7ZrDrVBrSLCdRu4HD16FnPoJnvZKf4+OcZ9aMSYm0uxlKjb0Ne643jlg8+SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774025153; c=relaxed/simple;
	bh=F8JhpNRtISwTJCZ0mFH9huui70rVNKoYVUHt0NiS600=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JkhAFKiV4OL8l9FYIU6v0l6wqLITmuNS+t3sTVSMK3jdSJMf3wwSiPRkIqNzwotX94aE373duYuf51GqqtPrpv6SRF5JnmFIS8lTbbxbMk0w45hYlQJheKQgWJ0W5h1oVlK3DqoLXPksr1XtHen1romORDIce95Q9XsKuuy9VjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+nEe1f3; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+nEe1f3"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so1171409a12.1
        for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 09:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774025150; x=1774629950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NwqEwLydPXTJh37lAhGuKLAvUQ1T9VTG2r0Fov0v/5k=;
        b=f+nEe1f3ErO1LIWPXRYEoiq23dPDAGj4OPXPaRSy7c38rdcD8XFurp84DcTYUvdloL
         Et0OqPT64yw6/cOsj/sMQPA8Pg6iRH3aq5HY0IKgfq/ej8H/MnO0/tohbPTv0wPB+mN7
         VHqap9T9fg/+M/Ei3HVkQkaazhYjoliXSEZrAbKisba9cCt5C53jmKcYYKKegIEHFzZZ
         lHJVmF9SmUzTLNWNdtrgCN13loIaTPcbi30Kz7kv6a+LE+DmOFaZ+wtTfAN2xC3VB3mW
         c/1O9iKPgeFeGEyZyY9LxLZkKT4Dqiphm5fzGSwIPVkS0LlHkUE3IMmJuTaS0cxFnIqs
         qv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774025150; x=1774629950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NwqEwLydPXTJh37lAhGuKLAvUQ1T9VTG2r0Fov0v/5k=;
        b=KWU6em+G9FUiZO8Pf9NL9AZ8qblcMFyJyFAkg7VCPggmw6ErwM9bTDVu3Enh1e+oCV
         uW3huCDFa5vh3WwpW29iwueG/LMQeeNjbZv4SUE17G+/D52EX1nBKCOMbk4KHTsnKYhE
         H4+9HLExSo2jqb0dUNZisodDgjQeb5FGNqKJd5hyHa6J9gqIevIT1tSQtNvEdKadkG/F
         B8Ur3f79nMaODNakuPebi3Av/NfH5113oF2DVJiZPsVTRvfAYJN+nSYVHbRjeEY6CGqp
         i67RTsxHdTIIT/lNXtEiNnoehnurlLghbk4bBwwWDFH97fZMJJdW6WD2gAAxE5XVX2X2
         6tvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhehc1eQTW6vkJfP8Z1mE3ZCN1GmR2FzwZcFV3ysCQ79Ju2FU/4RxfX40VVd0V0sBrXQMAqoN7H/tEGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuzpSOWSM56nPQKU1BqjZsIpwADr7z0QzvJv8Vs3Db/HeQrEYv
	HlQeT6i2nECwdSE4F5nFY3He4eMAz5QcPBuvbaXHUDC1iM970mmrJXqZ
X-Gm-Gg: ATEYQzyA5FFw1rN+tbE/n1BvSWXPBpj4q4976BTGHD7RSWifd/Uy1t2dnvg5UCvVC7a
	QiUwczeiWCOJ/YV/MIPO3y4MvWMDkjXl2xvvO0LRoDGyDhkGwnzUT364/4taSWqHEKFVyT1Z4k8
	s93N107kcpPx0SYf03yU8mMtU7Jku1MyK6NM6us5SBWnhbg01qsUYTpN46PCkDbkZRlsUuRr5DR
	VBIQ1ikceWrjRuOAh+ZWasLZ9il7zav87MpMVExcy3P+QAOeooYYmhmJAvGs0lJloTCDMpknb7j
	U/fF7wufEhqvhLWNl6x6onnB0wDOtd3LFThGD2zA/m4r4Mkto3DwTgS3yGbf/O7MglFXMySMuty
	EPLqza4fLO/sO8O/YU813DnRSzUGatT/C+iI2EOFz/Vm5i/4v6k00cqtk3XIUBGZXQ6pL7P2r4+
	ji/q7jvexJ8NHFP1ei6xKTjWBgs7VAY+ulwnBu
X-Received: by 2002:a17:906:4107:b0:b98:baf:638e with SMTP id a640c23a62f3a-b982f220a6emr206784666b.13.1774025149534;
        Fri, 20 Mar 2026 09:45:49 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335f1747sm176730466b.33.2026.03.20.09.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 09:45:49 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Fri, 20 Mar 2026 18:45:40 +0200
Subject: [PATCH v6 5/8] iio: light: vcnl4000: remove error messages for
 trigger and irq
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-vcnl4000-regulators-v6-5-0d24d20b1a5b@gmail.com>
References: <20260320-vcnl4000-regulators-v6-0-0d24d20b1a5b@gmail.com>
In-Reply-To: <20260320-vcnl4000-regulators-v6-0-0d24d20b1a5b@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.14.3

The error code is available in the log after return. In our case,
attaching a triggered buffer can only fail if we are out of memory, as
no other buffer is being attached. Remove duplicate error messages to
reduce noise in dmesg.

Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/iio/light/vcnl4000.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index cd7e6ee42cc5..76aee16d479b 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -2033,11 +2033,8 @@ static int vcnl4000_probe(struct i2c_client *client)
 						      NULL,
 						      data->chip_spec->trig_buffer_func,
 						      data->chip_spec->buffer_setup_ops);
-		if (ret < 0) {
-			dev_err(&client->dev,
-				"unable to setup iio triggered buffer\n");
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	if (client->irq && data->chip_spec->irq_thread) {
@@ -2047,10 +2044,8 @@ static int vcnl4000_probe(struct i2c_client *client)
 						IRQF_ONESHOT,
 						"vcnl4000_irq",
 						indio_dev);
-		if (ret < 0) {
-			dev_err(&client->dev, "irq request failed\n");
+		if (ret < 0)
 			return ret;
-		}
 
 		ret = vcnl4010_probe_trigger(indio_dev);
 		if (ret < 0)

-- 
2.53.0

