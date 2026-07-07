Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2732130C16A;
	Tue,  7 Jul 2026 01:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783387679; cv=none; b=FIJglhoKkUV/Mnel7cXioTdy5Wdsv1Y/WNlGes65TL9XJqRvaM22/bt/I8I8msNpIUqSWUs8x9UtVYljWALFg7GJFofOW80p7M7S/LWYLODlR2sVvaG2Usut1igJ4MwpTTom7wroK0WEXkSi+jbDAtzSMMTODk4Aj1jrQ8DPs2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783387679; c=relaxed/simple;
	bh=m5PU0A7DZLqhTpU9zZv+4Jbxih3GSwFAK9QaULuxcV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WMgTd8fxRzg8VLKI35AmjiHGpJs73vG7oL4ZAqzJpahrYXekLwDkvXb4STgTVB3YyFUfNHRRjJ7qyaHPlG/BCwRJHOyUwUIhb78XTwMXLzS5SIRFcmzBtyxNMsGLKBRlZ4XDcCiiVu4xZ7GyJ6sXRnh4CymGBQdNlULVy9zMpKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFYZu6Ah; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFYZu6Ah"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 320A51F00A3D;
	Tue,  7 Jul 2026 01:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783387663;
	bh=enJKCZJS7OYEUEz9Bxcaj5lxbZmcFfs2ilffkyxLUOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FFYZu6Ahus8P/Z5QLwe3zK8jsTddPEJyJY2ahoMgwE6QrNf2h40mAxFDKAGibLEMl
	 BKcT2OdR+VJnYKxFrPjAckqYeuU5UFn3joyJVScAoa5M8wCNqwNJ/Dzos4tJk9gl4Y
	 2pQX4m7hnrZ/0ZCJMQbwXtuLF5Pql4a0jvxUjS4MCSgAYMijjICvWE4kamxW5tP8On
	 FI98fwvPYfUu0tmRQdXAKPlaciOc7Cz9V8WcZO3V65FEA9H9OoyGxvi3s97Tp/dXKK
	 CdmFXZPxiqu93U5PE6/FaPkQgehviYz2Ylp0+y9eLmbvDa14SXwVNUDj3kWTG7CiFA
	 4jLYlmwh5gGhw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] IPA v5.2 support for Milos and Fairphone (Gen. 6)
Date: Mon,  6 Jul 2026 20:27:25 -0500
Message-ID: <178338764549.1558388.6860652303646519518.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410-milos-ipa-v2-0-c699b6b8cf27@fairphone.com>
References: <20260410-milos-ipa-v2-0-c699b6b8cf27@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 10 Apr 2026 10:17:00 +0200, Luca Weiss wrote:
> Add support for IPA v5.2 which can be found in the Milos SoC. And
> finally enable it on Fairphone (Gen. 6) so that mobile data (4G/5G/..)
> starts working.
> 
> Depends on:
> * IPA v5.2 support
>   https://lore.kernel.org/linux-arm-msm/20260410-ipa-v5-2-v2-0-778422a05060@fairphone.com/T/
> * Describe IMEM on Milos
>   https://lore.kernel.org/linux-arm-msm/20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com/T/
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: milos: Add IPA node
      commit: 5b372595d4b4cd471f49901498a920c983310c47
[2/2] arm64: dts: qcom: milos-fairphone-fp6: Enable IPA
      commit: 47dd81735741b60b53dc2ccd4a48b0ec74c9adc7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
