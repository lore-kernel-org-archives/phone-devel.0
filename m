Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E2D2586D9
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 11:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582046; cv=none; b=KkM9YKZuJ5SIJce+a+UcXLWaHpIM7UL8bI7exhSjv87B9S8xJpVIqwXIJ7hRFRQAG9hoTIY9SZr90xplgOUCMPe1perIKPtqo72T7xF/ZnO5LKiPu+8JHIyc4vKtSXUMhxENIKj2Dr+T+ZL4l543sxuCqWD3e+4SBGrFed3eVrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582046; c=relaxed/simple;
	bh=Wp9iWaEevQ0aCH/QYCEHu08kXHucbrbsnspzcdlMP28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fEbkwJF4V5lqLjs4aV/CMIjsozHOTLgs/+dXBL/wjwUpjWN6BegyctR9WBpsq7TM5SGPEbzeIHe+Y+6em6ISuagFS14VFdo4RJiIx8DFDN9u/Dmj62DWJQzwBZlVjXaGF5GakclEaD8I+NjAZjaQZeMAKx/7nQPl7NLEAY/WWDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=R+eeTKLK; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="R+eeTKLK"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso471402766b.0
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 04:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745582043; x=1746186843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6cpfS3QrdUns68NcbMwvTGZPMa8x+Cgf6fBqEa3ps8Y=;
        b=R+eeTKLKPcu1iJwwRVh74OGOwVyksp/ePYONMTkyEewi9nh9LhL+/8JOq+LvmsNFz3
         JqBD3o6NOTPHTGbRPTJu8unkUUMa6PQW2Xf6SCsRFQhmcroyGLoahqdSCNhDrqo/KQZ9
         zdZjAsBAbx/dLpcy9wKEo+WJNulL/blN3aLhpCgaOmV8iheUFuwkuLccMdpdDlxU2Yor
         /xona+hE9M+BDLRRSGw85PpUUKkH3oxeW8I0LtbETfJij7fv4VuGuJFCYV18MWrnRx22
         wDPp4erBwBcam90iXr+K0+8MhWGvOesyNuKnTSmlJjFaY7dRF7UtmDT6Q0hx06pgSjCT
         aRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582043; x=1746186843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cpfS3QrdUns68NcbMwvTGZPMa8x+Cgf6fBqEa3ps8Y=;
        b=LMBhFy/MeDThzVLlox3U4AcmTKLVj/RcRq8p4HhS+udjVHOjna6WEgMMFD8sXJrKbE
         zLB3FwP3lOrugLBKX3o10jQ8s4c/a92StahzOnkP20507TZFUPfLOJ6aACb3HlyKH1S9
         jHIa6Md1WCjbsIXM7G+KafozOn3fukUVGVlzf79g0UCrML4Ilh7zkFMdJsYBkaKPruSs
         aOoCQXfEqOxw+1ttbiQkl7RYXyT5f+0kCKcLG0J8IYpwC/UsPwhrCY24US2Xy7OJKreU
         kqTnF2hYoSfoGmEQyp0SIiYO3rQZ+D2euYT2LW/7GTOlgO3MZsUHBSQj6zQt6BHmbEus
         ca5g==
X-Forwarded-Encrypted: i=1; AJvYcCUo7x28ZiVgWVugIrimGm30DuvPd8ALSfLrhb5ErY99Tbb4B32Lb35IJEMOGCwIChg9kI2StYzEKsxAfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDdEEfEpW09T9bknOf/0vyRSyHbLHRwYbtZK4xI09DxsQ2NLXS
	bNfniqg7EaQTO/VMfTQU5SyjCX9v8Dv22TZ0fKkFjOvkpWmyW/88hWX4F6XNQ+8=
X-Gm-Gg: ASbGncvE9v7w4tAh3x2OEUzDzHjKWxL0W0R7/HPQZvxMVJ+e5QKSnZUJlgHBg8gdHED
	DIwhDfIGP7XSC9UXzCg/MG5MpR1UBfkD0gauZVTTclUwi/DTL3aU6Ipu109xf0HtFpSxlNfWmYh
	/wYyIzS47n3VFPaMEmXlgJ4hfDokNFvmEU62oI0QmYY168v+9e2Rb6YnwqnSeqekeEQBrk5O+Yh
	shsIRzzHpMs8dXyxHQdjuFJnLNzzNHgEbONO82z5S9n4YrN2zrJM9FhTWBs710DZSAXwCjad2XV
	XnAH9P5w/NkxSJ+X8QRo2wt0TUMsrAy4uokNQyW4Bbrt5tZkEbknTC0cEWHyaALutoN2NiIUFe2
	ryc5L9eot0uGpZWpJhvNTPG4hfD9urdRyITNRXCgiKfy++7/J5sEUYHcQjUG72FCXoWI=
X-Google-Smtp-Source: AGHT+IFMeoo/hjF7l+e0BlykAtp+n1CvAkIhTlWy1LgZY1D314XWrkAO+8/iKA1i2R/FUs6u4NVzAg==
X-Received: by 2002:a17:907:60d0:b0:aca:a1e2:8abc with SMTP id a640c23a62f3a-ace7104d6d4mr182372766b.12.1745582042961;
        Fri, 25 Apr 2025 04:54:02 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm126081566b.33.2025.04.25.04.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:54:02 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 13:53:49 +0200
Subject: [PATCH 10/11] arm64: dts: qcom: sm7325-nothing-spacewar: Use q6asm
 defines for reg
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-q6asmdai-defines-v1-10-28308e2ce7d4@fairphone.com>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
In-Reply-To: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
readable. No functional change intended.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index 85a928f980775de0617cdabfc31a96d044c5744b..befbb40228b51ad2771a4c0e6799d26045af5917 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -1223,7 +1223,7 @@ dai@16 {
 
 &q6asmdai {
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
 };
 

-- 
2.49.0

