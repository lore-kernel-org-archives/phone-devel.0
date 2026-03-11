Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171E431F9A9;
	Wed, 11 Mar 2026 14:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239929; cv=none; b=iv6JxbkAmClBAeOyXhRRcWufaV3kP9WRTa45YRoDq8PLUXNvQ6hUjQ6ph5c3bjBv4GSVsQ+U/dUF4uFBjYOfOMmxmzyrjyjlnViyMKN6kj48w2FN5IQyoArrr3oSxZ0NPzMNqyI7BOjoTg6JOyAgb0wNnWzkxXwgKdJD+d1JV2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239929; c=relaxed/simple;
	bh=qMMy5A94gz6RsaCuJ8Z2SJDEihUSquADjkr7aioQj4Y=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=YDUP+AKpgJYc6ENqIr4mKwY/dJA+u9qyD6bmrvfRScAIngSrH+uKSXSKpoyDpe8+jJ56+nNstvifvFHJ/s3cLgDXG7MZycZPUlpR0v+ngcI3Gkdx99XPgxxVE1fxY3iuOZ1N/j0lFpZ/A1tMLI+jQHfHmm2AQQwwGCk5T9ScsTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=mVDHKYgU; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=deitwnyt; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="mVDHKYgU";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="deitwnyt"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1773239923; bh=NMGLea/U+XVtK+8ZcCy3z+w
	9ohGbvbUlzo/mZjIWQcU=; b=mVDHKYgUVT2o3xdUfqpodzCSrroPVNRQTJrphGnMtumTsW7pDx
	vMIvJfNRcVUwKvRjP5De/qgBXjtick6p99URLcQGGNDPhJV3R8tXx5LG5qcGvHe6Kr7PMZ1QWqY
	JAAiWpgYVWfx8FAlEQMwz70gHeF56JXUTrjn4UceQQZl26Wu4iRDWrz2q/7AhB88sq2ky4lS0jE
	1jy2WIwgJvd4QUdgd6ogIpxQONuqcwH40pIPeXIXPNRhx1bSGVTb/khkQuTUGCywYIniidViobO
	QKQ1SmXrszBMMkD81dVSBuOvMlLyRp4GtHa8+OQXZ8QpO2twE4xvfUiwqcd51q648rA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1773239923; bh=NMGLea/U+XVtK+8ZcCy3z+w
	9ohGbvbUlzo/mZjIWQcU=; b=deitwnytlbC2MZD12233j2ZPyV7dA9B4XNkuBpuPgSaVr6hQR5
	HHvTULEqWvDBHtKh5BHihwghxCl9m8vxTNBw==;
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 11 Mar 2026 15:38:43 +0100
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: Add Redmi 4A
In-Reply-To: <9b6520b3-aa43-4657-aba0-bba89af8a47d@oss.qualcomm.com>
References: <20260310-riva-common-v2-0-3bfc23996857@mainlining.org>
 <20260310-riva-common-v2-6-3bfc23996857@mainlining.org>
 <9b6520b3-aa43-4657-aba0-bba89af8a47d@oss.qualcomm.com>
Message-ID: <37f385d1ad7a464771e641807d75f5e5@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-03-11 10:16, Konrad Dybcio wrote:
> On 3/10/26 6:21 PM, Barnabás Czémán wrote:
>> Redmi 4A (rolex) is like Redmi 5A with small differences like 
>> charging,
>> fuel gauge, different speaker codec configuration and display.
>> 
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
> 
> I see the Go has some differences in regulator configuration.
> 
> Does the 4A's one match the existing 5A?
Yes they are same, l22 is vana l23 is vdig for camera sensor.
riva and rolex is using 2.8v for vana and 1.2v for vdig.
tiare is using 2.85v for vana and 1.2 v for vdig so l22 min-voltage also 
should be increased
but l23 max-voltage increase is unnecessary, there is no reason to keep 
downstream value there.

Here is some proof 
https://github.com/Mi-Thorium/kernel_devicetree_xiaomi-msm8937/blob/dts/mi8937/4.9/master/wingtech/msm8917/tiare/camera.dtsi#L16C1-L23C65
> 
> Konrad
