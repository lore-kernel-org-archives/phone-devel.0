Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8E9340286;
	Thu,  7 May 2026 20:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186108; cv=none; b=k2FIRcTUxpRknj4a68IVX9Gq6mGd7qTPHH6oQNzjE2MtDKoTUlq4qJAdF8rbCG76U8znCoQZfU7t5wBNOa6v4lRDgfqzLjZF9e9uBKRpOeWE7iiu3crRCN6ZwGfK07srjG5a0pp9LHeHTDSBf9zPZpHiBHJRydu549uTpQbcMmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186108; c=relaxed/simple;
	bh=pdUxHJFr/avUru8v7w4LIVbr8CD2Jlb/uUKuoinaArc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A+f4LjQuw43fcTFZrxsoaMrfkOz3i9vjoAjoxO9cK/ZZ2f6KGHBiYm28ro6k9HIVu2sJUTCNBWDRXPZ0GpGQ3AJ5n2AOvXuzoVzeKcExbbA23ct4u4GCUmh1xQk7wESnf7zL0EOSwXaQWlM8fXPErH2fASzQ5HjXZcUqw7Ps36s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y+PUi/yC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y+PUi/yC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293A5C2BCB8;
	Thu,  7 May 2026 20:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778186107;
	bh=pdUxHJFr/avUru8v7w4LIVbr8CD2Jlb/uUKuoinaArc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y+PUi/yCbGqZvPZczwZ/5C9kjmX1l+BHtEL+exqb2+eWd4F7Gp5Ql8Z0cUzLZjwe/
	 UKx471tMo5ZtUKjDNIQb+GIahAFSqvWryJkGrA5c4qEE4EQtgQoX18XaYET67raw65
	 5iWPy8nYqZLhkVXDYE2X8UgTzVJsAoqcuGs3NxHwGKm7RCwqR+wlENnpwWQkZPK1MO
	 Lb65y8KVn0gOd3JBt7SQmr9rOfwZ8M2h7BX0X4rakB/x+yiYhxiY/0PvNk5oLHXQLa
	 ITcckwKaATdXRBANcZ3Z2rNCYXeuw/c0p/hoDNjLsJUAoslEqjM7T7GrqAcBBBAFOc
	 7OnPDKcsr1oew==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v12 0/3] arm64: dts: qcom: sdm670-google-sargo: front camera support
Date: Thu,  7 May 2026 15:34:26 -0500
Message-ID: <177818606015.73000.6974952903773673444.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331194437.41041-1-mailingradian@gmail.com>
References: <20260331194437.41041-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 31 Mar 2026 15:44:34 -0400, Richard Acayan wrote:
> This adds support for the IMX355 in devicetree and adds support for the
> Pixel 3a front camera.
> 
> Changes since v11 (https://lore.kernel.org/r/20260324020132.8683-1-mailingradian@gmail.com):
> - mention 24 MHz in mclk2 comment (3/3)
> - drop applied patches (previously 1-4/7)
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
      commit: cbdf1a61dde22c226a776d60ea5bff260b94f653
[2/3] arm64: dts: qcom: sdm670: add camera mclk pins
      commit: 86695909eab6bfa577bf68c615dbe852ba9c8197
[3/3] arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera
      commit: 8d3a34d7890faa4d968b16e29c5c80e559291fd2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
