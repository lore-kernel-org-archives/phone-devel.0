Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1813C6611
	for <phone-devel@vger.kernel.org>; Wed, 27 May 2026 21:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779918967; cv=none; b=q4k70dQcWYChn82D63Tkpj0mmsIC2/ZCFLJyXQGOTON2X3EElw8BkWc8GSoqJk9obL9OmywXL7DcKJwiX9jeai9fNzse8EzhnyifmAOYAgwBV2xr8hlo0y4OOgXMemQ02XfVG6MeXCDWckLzejX/i+figpzQIkyUn3isNExsFnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779918967; c=relaxed/simple;
	bh=cGKtD3QmWzMTCMfMKYNFa7orYz8sE6eXPChDz4N75IY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSrIUmwTP2vxvC+jzyj6d/9MRM/BxEhLSKWcmK77lrwOdMGumriB8xwvDA4/JvTrzMuYJ3MeUg1L+QnQGUdrpF7FfvRBlDNlNwYbQCus1QXE2dvGRC4CibdmWmpPgdzvUdjFUhcN+oaTaIpDT8b3YojBbYu0HN7SRUSs2wTAcxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDHCWD97; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDHCWD97"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-304545f5206so8224547eec.0
        for <phone-devel@vger.kernel.org>; Wed, 27 May 2026 14:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779918965; x=1780523765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lXg+VJDmtN8gtR2tAPqmElloUoo693bty2sHUHo0J88=;
        b=kDHCWD97AFaM0TwG/LKKBFvGv8ZfsoJby8ur46cvwPMS2jOwKjW3mit0bDkFamtB/N
         qTyCVW+41DzBsXjUyRANmyhLGdxJzh2I1Z+MGEFsNw79DKMHsQZVPa1D090SQEXeOgkQ
         JFisuGkFjYzHcU2wqaVcSyhJG/RoYdNCCZGggvrzSfgXA+OYpJNgGE8Ncwq5pHZlZWff
         ksCY2j/u9nF3GgXcVFnev8mbCMIjmu8oIJfmy3anyjfqWsbGAkF9oaz4S/aJFLZFwzav
         +I3cV69WwqlXLqcXRl543IW+3EKnCeU8KQHjblU52eSjjLWcmwawOgHpS63DIM+Qi9Ns
         iANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779918965; x=1780523765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXg+VJDmtN8gtR2tAPqmElloUoo693bty2sHUHo0J88=;
        b=prRaEThgVY4bQCl5s0UhIEZ/NccEoF5hWH5A26C/pRLmNIHHctOSLQY7srWyITNivh
         wq7vpRXLeiNrCMol5S8533y2VfAPzfr34fiqTzolQytQhPJtwLOdbhca0UmRpV9Ge3mc
         jqmG5cZSMAnBcq/fDGOxBN3D2cXYi+uz9GwMbhjAWaUMdm9ua1QRQdJz7OBVwoxiBv1D
         SkeFMswwgP+ZS5Voz2/WsSy93DsgvYG/0JLvcG++7rEDKu4xk1NWngANZuY/7TD5ionw
         buC/d4w6uCQM1CKJPGAl2paUIzDJEQn6gaMuDgUqi9T8o7Itb3GbwxFANokZWyKfxvT+
         Rfxg==
X-Forwarded-Encrypted: i=1; AFNElJ9xz941sfDetOh0EY2SVEhavRHqYMd0mQxgl9PfNHbAzByddn6HbtAylDE1EbuPuz3pukcmISEfBv6E3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4RWggHI/yg4T7xbMXRCZfcTf4xO4O4NaDWzT0I58v560IYW9B
	4z/vFj9GHPR5iu7uPFNEZpzzWqbxz0hYy6PRnGiqejZ7eIuKdzoaVbYl
X-Gm-Gg: Acq92OFnI9XRmgtDGP0sKDFWXlnUXhG40DU7qoTEO3n7+p/Q2XQkM+vTK78BP3u7tXU
	xNQargO4qrrtAvvedfA3t9vfn63Y1un4rRtscWVEdmCvJaF5L5roOSPHbrlYfrKm2OtBTvB5K2e
	l/D6PFwNUO7txW8xYpBCDd14mlciGsqMIkVfe8PGz0DU3A7iVhTHI42IJ39f3lbz9BlkPsYbKan
	RH8gbNUxndklqezOv2mnZs04O63ZXVNHPFu9ys/quOOGASyvAxhEl7IhLtzigUiKcuwqZzXu2sP
	e3ZQho4XWzPLH6Bt9WAhSvIKVDE8IjBUfL59rq1kGTOv6eP8g5vmoS8OzBmPb82abSVveKOUFeM
	8FKmZ0G1Y0v2eg29mLSkSsWVVf28gWP9dM5MlMcIP40Kt5QgGiJANYgkdxV+F2BPJZQRFES+5Y8
	ZFcKJlUlPzffEzhfwQSacBgfst9Uale23CN9b0/0ygXAG8Vm8yt7SXIRKTurI4fIox9eYEc/br+
	Sk=
X-Received: by 2002:a05:7300:b507:b0:2da:a813:a5fd with SMTP id 5a478bee46e88-30449103797mr11617618eec.22.1779918964504;
        Wed, 27 May 2026 14:56:04 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:ca8d:7a6a:7fd3:5948])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045245f4e5sm14357429eec.28.2026.05.27.14.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 14:56:03 -0700 (PDT)
Date: Wed, 27 May 2026 14:56:00 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
	Vincent Huang <vincent.huang@tw.synaptics.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-oneplus: Update
 compatible to include model
Message-ID: <ahdoBl3qCTyvlYJf@google.com>
References: <20260523-synaptics-rmi4-dt-v2-0-0645122babdc@ixit.cz>
 <20260523-synaptics-rmi4-dt-v2-2-0645122babdc@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523-synaptics-rmi4-dt-v2-2-0645122babdc@ixit.cz>

Hi David,

On Sat, May 23, 2026 at 11:45:35AM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> We know the driver is reporting s3706b, introduce the compatible so we
> can more easily introduce quirks for weird touchscreen replacements in
> followup series.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index 6b7378cf4d493..148164d456a5a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -475,17 +475,17 @@ bq27441_fg: bq27441-battery@55 {
>  	};
>  };
>  
>  &i2c12 {
>  	status = "okay";
>  	clock-frequency = <400000>;
>  
>  	synaptics-rmi4-i2c@20 {
> -		compatible = "syna,rmi4-i2c";
> +		compatible = "syna,rmi4-s3706b", "syna,rmi4-i2c";

So I believe we established that this device (s3706b) does not in fact
implement rmi4 protocol properly. Why do we have "syna,rmi4-i2c" as a
fallback? Shouldn't it be just "syna,rmi4-s3706b"?

Thanks.

-- 
Dmitry
