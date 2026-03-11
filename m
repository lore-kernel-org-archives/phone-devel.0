Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D788D3D75A4
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 11:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773229105; cv=none; b=LEEeeDXVjrn5D18N0HZSV4MGI11XYyuRG5kWCax/2nTVQhwsswTASEYfKq+Bp8YpfQWGxHkZLI/wMHcddQYFJYx4Nes6Y+xd2fWC9vEpWR+VqXswXD3IkTS+VxA2ttbUrVknWBq8oK/5YHEEgeCqzEGDEA83ppFZbt+NyxZW9f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773229105; c=relaxed/simple;
	bh=xtGiKjEnBQpQPUntP7CaatfwfFSBZpxu8M91vVnlSNA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tKSz5rY5aazdDQ0iBrjMZ1oEmmVgDhDX/OJF7z2lBMFnkfiyNAq0m96Zc+2JNK7Anl3n3TPpKD/cjSDGf0oJyNGCUFsfjxQz9+cZL/eQmF+Sd0H4D2VaGaB0gwlsvrUVng1InPIHXtfZE697GuC4DWJ8npOprh5ZHHsFTGJb4gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFA/Mv8z; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFA/Mv8z"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-485409ab264so6508165e9.1
        for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 04:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773229102; x=1773833902; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V54kHQSlYQm1LF5g5xy9u1LvyxUv6rsWTsl/vLq0rrU=;
        b=YFA/Mv8zPgMhKIKkkqOtZ1Arczl26+uiu5XndIrDYRrspF9l+U0/hqM1HgxW9pLUJv
         iNoXffyQJ/9T4HepdCzm/wdgh9ZuP03qqgKyXUbr0aEywBXSXOsGfTy/WWQCsqN0wDIk
         eshupzR7oHMxDq4yiWvPmWX4tqKBxybSqD7o/qSp3kUPkOrgFO6/qZW87ixUA+IksBKa
         xZSdAHAPhy30QVKL5xHWqCEVJO2vAMC1UvtcIvQUXuAoO/QCwDCgCe9ld2D/a+rpSGVl
         GOql9XgPlRu1tmBxZAZUyOqVMvm4QVaNmwiSO38kf04FDWzmOD7JdAUwiwMp27/1Jxq4
         wKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773229102; x=1773833902;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V54kHQSlYQm1LF5g5xy9u1LvyxUv6rsWTsl/vLq0rrU=;
        b=tAWeekMTMyJtMxmnPb7ObZdXii480JQSpqTL2JQQS6qJZqn0urVHf04ILiM2G49IRo
         +fx8YHShtBq/TglZHSVgzMljCo3VuGblnrne2zrsOkHZ+8lDOhg9ltfPY/5zgJdfQRN6
         dNNCNwQUFv0VaMo6r0Xq/o9CvOcab4bb9oJQs7IJ9OWOfBOS1Jmol74ZfEExHDJ+Pbyk
         bQdPrsTgVJ85fw8lpSz3LgMuOBX6J0tQLj8jfhE5IS0kODM3oci2EC5tl2mpiq/Q7+p1
         Gh39e7higyqCnAZSb5JcE+g8L5jlGAaGKCp32wQgxem2+oKdt6dL3BW3UAdnxkqCEdAn
         AoVg==
X-Forwarded-Encrypted: i=1; AJvYcCWKjx+IgkKtsXS8X1XnfE+jvBViHS4N8f2QlUpjxXDLC++WHAxoGzpKQ+Lq+qCXJFC7J2iMBXo5nP9IOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBmPEMTVCg0wnqQryof6yw/83CB4m41Wbs674ySYswnFgq5IBN
	/ofYTX6O60VToeTVl0L09wo77V0YIu9/1glB014o8PuVaxnXP4E6hDLME/uSpEG7
X-Gm-Gg: ATEYQzwbhPBH7/UmM6/i0tTV5uR3LMiIKtQiVFCmHG2wgda651p8k0G56U6vHXdI0p4
	Grje7KMAQaWP18KoC1oO9hRwemfPcfbR4mbRtvcQQ936JJ2kwBnhyeGb4PE1DLPFsbnV+Y76JKy
	XQe2tAtJPo6aV7n9I6lUHf9crJHycOPb7/CyL4jh8oFsTSukZe6+Uo1gfENcISrx4cAWrwonO8h
	o5XviynOLT4mPZHcoqZbAn7NHHXTlVFFMTcHPzLjHtTgGttZCSlniEIfauMS7Yt/vJ4bbiU4qsK
	Bhe6sYszeZiZlB0QKLyRLoHAM8Aa0WDrpkdl3Osk8lk+0v/pg75HabpBxBCgmCBcHP5tqHpsMBB
	r9CgTtIKHOphG5yow3MJhPdyYmHJJi24EfFWWODxd9Y9N+d91lVmbZfttRuRkGs2suMtLXJQ5wZ
	dhVp6Kkt++TmauIDYoXjVqxXx7Yw==
X-Received: by 2002:a05:600c:6808:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-4854b2916d5mr29289375e9.13.1773229101905;
        Wed, 11 Mar 2026 04:38:21 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6b7sm188681855e9.9.2026.03.11.04.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 04:38:21 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH 0/2] iio: light: vcnl4000: add regulator support
Date: Wed, 11 Mar 2026 13:38:01 +0200
Message-Id: <20260311-vcnl4000-regulators-v1-0-66b6038ce563@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0atIZgtJFRGvIg61Rg1IK6mKIN7d4
 viG/x9IrMIJuuIB5UuSxJBBZQF+dWFhI1M2WLQNVoTm8mGrEdEoL+fmjqjJjH6msXVInhvI5a4
 8y/1f++F9PxrthidlAAAA
X-Change-ID: 20260310-vcnl4000-regulators-bcf1b8a01ce6
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Raymond Hackley <raymondhackley@protonmail.com>
X-Mailer: b4 0.14.3

This patch series introduces support for voltage supply, I2C and cathode
regulators. This fixes an issue where if a regulator is shared between
the proximity sensor and some other device, and the other device is
powered off, the proximity sensor would be powered off as well.

One of the commits includes a Reported-by: tag without a Closes: tag -
the report was done outside of LKML.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Erikas Bitovtas (2):
      dt-bindings: iio: light: vcnl4000: add regulators
      iio: light: vcnl4000: add regulator support

 Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml | 7 +++++++
 drivers/iio/light/vcnl4000.c                                     | 8 ++++++++
 2 files changed, 15 insertions(+)
---
base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
change-id: 20260310-vcnl4000-regulators-bcf1b8a01ce6

Best regards,
-- 
Erikas Bitovtas <xerikasxx@gmail.com>

