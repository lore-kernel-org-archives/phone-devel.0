Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7468D34104E;
	Sat, 23 May 2026 02:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502819; cv=none; b=FgKsH3hM8+AElJHm5qDQEdJ6g9AuFwNVX7fVfBQuU+h+o8jvJca/YQjhK0WBIlz93NfSsvapQOpQyUnERJK1yZVHuyiKBqEJvRmFHUnMV0aWnqErG762T7H7b+UqKFJVpzYBylfsvflkMFjrU5YI9lXjjo6+4C10n5BYNUVmqmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502819; c=relaxed/simple;
	bh=RYkZvpHgmFNikFhUyDTnlMhTpX5/4QMLYUiw9G9c8tI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jb0DYdquhZujNKj0dHa+rXMhmiA5707y/39/kxut0chq5NLknOJbBy4KNxwRkUcmLZ16Qa5L1sBGAo0GE7zDEyg7CgwvRQbxFBWqyeRSn/EmOSBHutrB1igNocost++W+WIzKHgVNzE9jxW/+WZEsy5ZhbZok8I8IusjIk/cqPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UJEYnW5a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UJEYnW5a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574991F000E9;
	Sat, 23 May 2026 02:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502818;
	bh=TJLCvh/br4qb+PxJ9UoESVVmmyLq9UZNRTeC5+yediA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UJEYnW5amPkr7CR9U9y49lfPNCc9UAEw5DofsL1E3nweZvLY4TYUJE3+wuuXMuUfi
	 r8+Gcm+gvklzLrXUq4gqcqoS4GBb0zpbDeuUzSkQW0SZG2Q1UcJ3s+cS7z95CilQ9E
	 F1Owh8QVozKGuEuVM9gOaFF5kQgCoLQMgstFCJw5qO7Md1e+dHDm+aZtcRLXJwycSf
	 bq6V5MVdyySmetu8OXXIPMEOhnxLxfSz+PNva0Krwvr0xadK60pYqtHgYKfnJx8OiQ
	 SpziXZgQ2sZT12rTwZhMtIK+N0jM7rfJX/u0dcxy165vQupJGFk+1EjNrAFYD8rpsq
	 tome53XPX1T4A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Robert Eckelmann <longnoserob@gmail.com>,
	David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Joel Selvaraj <foss@joelselvaraj.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-xiaomi-beryllium: Correct IPA FW path
Date: Fri, 22 May 2026 21:19:47 -0500
Message-ID: <177950280361.1097700.4701778040906821027.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429-beryllium-ipa-fix-v1-1-816326ba9047@ixit.cz>
References: <20260429-beryllium-ipa-fix-v1-1-816326ba9047@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 29 Apr 2026 15:16:53 +0200, David Heidelberg wrote:
> The path was accidentally reverted back to old while refactoring of the
> device-tree.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845-xiaomi-beryllium: Correct IPA FW path
      commit: f3cd85f60c5eb2d817af6c62465018dd941ce4f3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
