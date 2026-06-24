Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE071FFC48;
	Wed, 24 Jun 2026 17:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782322237; cv=none; b=ROJfJ2t+Oc90WtDarSjsENX6QwtvOSEafKPwqdDfFm98xroY2akrW16gaMnUBnOQgDZu562dZw5+G+jXrRVHPl1v+EqlO4uLSpqHXOFw8aukkEOrk+c+hrJJoY40t4n1icdulptroi9smsrEOtTNbYe2C1Zn73A5IY3nrr9MY4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782322237; c=relaxed/simple;
	bh=1NW8xouruuORoUuB1OXUIgSirStgX6IUnPKVsubKicE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=l/zRrOiZ9ZpM4OZlmLcYoFZLzFhMZJfwhoEDFN0kT4T7DE/gje6dQuFjmdAQwZD0wAHusCTyBBY0yxk3oA8JIft4y8wBdSF858fchH4oueFokMKheNJRpKr42DOSqe9hzJfUMdk1cTogQ61uxpREJccpf0P0+NSs1yAFBeH/JLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E08dD9M/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E08dD9M/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4041F000E9;
	Wed, 24 Jun 2026 17:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782322236;
	bh=NtllajPUK8pNbCH5Sg5mf10NWoNUabwl2VDQFDahwnA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=E08dD9M/e9JmkMjl3YBHeGU/wLLjM8y/g+n7W0mtj6SKi9A2ManngzK2KwP89NLkK
	 jHrpgOWaOuIg/56kxzJbKhYamupU2arK7w/Snzz+WR7n0JPIdv2OBIj6DpCw9P+65w
	 e3gHHKlmH2jViZzmulMkbJ2NHBGZTubsiDL+0HfNgykjwcl69k11espZCUPpCKLkDw
	 MLckr+9WweAhxjqN5m/o3jI4OHqlmJXXLxj+UvbpcER1puUoUQvcfzR8csf/exHsmz
	 pgaoaCUSYcKXHqHfxtmVhiWRSEZYXqDB4mKQ70ZxE0eUd3491CyJP3fas2f6XiwO69
	 Ru7VuV3WCgzgw==
Date: Wed, 24 Jun 2026 12:30:35 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>, linux-sound@vger.kernel.org, 
 Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, phone-devel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 David Rhodes <David.Rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>
To: David Heidelberg <david@ixit.cz>
In-Reply-To: <20260624-dt-cirrus-cs35l36-v2-1-74eccdbd8fe4@ixit.cz>
References: <20260624-dt-cirrus-cs35l36-v2-1-74eccdbd8fe4@ixit.cz>
Message-Id: <178232223507.468387.3561420324292249199.robh@kernel.org>
Subject: Re: [PATCH v2] ASoC: dt-bindings: Convert cirrus,cs35l36 to DT
 schema


On Wed, 24 Jun 2026 18:02:25 +0200, David Heidelberg wrote:
> Convert CS35L36 Speaker Amplifier to yaml.
> 
> Changes:
>  - maintainers email to the generic Cirrus email
>  - Both the codec and downstream worked just fine without
>    VP-supply provided. Align with datasheet for similar models.
>  - add dai-common.yaml to cover for '#sound-dai-cells',
>    'sound-name-prefix'
> 
> Reviewed-by: David Rhodes <David.Rhodes@cirrus.com>
> Co-developed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Relevant for Pixel 3 / 3XL / 4.
> ---
> Changes in v2:
> - Rename the commit. (Mark)
> - Link to v1: https://lore.kernel.org/r/20260618-dt-cirrus-cs35l36-v1-1-1a43515666ad@ixit.cz
> ---
>  .../devicetree/bindings/sound/cirrus,cs35l36.yaml  | 224 +++++++++++++++++++++
>  .../devicetree/bindings/sound/cs35l36.txt          | 168 ----------------
>  2 files changed, 224 insertions(+), 168 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/cirrus,cs35l36.yaml: properties:cirrus,vpbr-config:type: 'boolean' was expected
	hint: A vendor boolean property can use "type: boolean"
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/cirrus,cs35l36.yaml: Unresolvable reference: /schemas/sound/dai-common.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/cirrus,cs35l36.example.dtb: codec@40 (cirrus,cs35l36): Unevaluated properties are not allowed ('cirrus,weak-fet-delay', 'cirrus,weak-fet-thld' were unexpected)
	from schema $id: http://devicetree.org/schemas/cirrus,cs35l36.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260624-dt-cirrus-cs35l36-v2-1-74eccdbd8fe4@ixit.cz

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

